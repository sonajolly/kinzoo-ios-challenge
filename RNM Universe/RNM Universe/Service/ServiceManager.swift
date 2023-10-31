//
//  ServiceManager.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import Foundation

// Various endpoints and base url can be handled here
enum APIEndpoint {
    case getCharacters(page: Int)
    case getLocation
    case getEpisode
    
    var endpointPath: String {
        switch self {
        case .getCharacters(let page):
            return "character/?page=\(page)"
        case .getLocation:
            return "location/"
        case .getEpisode:
            return "episode/"
        }
    }
    
    var url: URL {
        let baseURL = "https://rickandmortyapi.com/api/"
        let fullURLString = baseURL + endpointPath
        return URL(string: fullURLString)!
    }
}

// Different types of errors and corresponding error messages to be shown to user
enum ServiceError: Error {
    case noData
    case noInternet
    case otherError(Error)
    
    var errorMessage: String {
        switch self {
        case .noInternet:
            return "No Internet available.Please Check your Internt Connection."
        case .noData:
            return "No data available."
        case .otherError(let underlyingError):
            return "An error occurred: \(underlyingError.localizedDescription)"
        }
    }
}
extension ServiceError: Equatable {
    static func == (lhs: ServiceError, rhs: ServiceError) -> Bool {
        lhs.errorMessage == rhs.errorMessage
    }
}

// Handles all API's
class ServiceManager {
    static let shared = ServiceManager()

    init() {}

    func request<T: Decodable>(endPoint: APIEndpoint, responseType: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        let urlRequest = URLRequest(url: endPoint.url)
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForResource = 10
        
        let session = URLSession(configuration: sessionConfiguration)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                if let urlError = error as? URLError {
                    if urlError.code == .timedOut {
                        completion(.failure(ServiceError.noInternet))
                    } else {
                        completion(.failure(ServiceError.otherError(error)))
                    }
                } else {
                    completion(.failure(ServiceError.otherError(error)))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(ServiceError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(ServiceError.otherError(error)))
            }
        }
        
        task.resume()
    }
}

