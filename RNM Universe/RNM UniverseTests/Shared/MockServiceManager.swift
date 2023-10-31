//
//  MockServiceManager.swift
//  RNM UniverseTests
//
//  Created by Sona Maria Jolly on 29/10/23.
//

import XCTest
@testable import RNM_Universe

class MockServiceManager: ServiceManager {
    var shouldSucceed: Bool = true
    var responseData: Data?
    var responseError: Error?

    override init() {
        // Implement required initializers here, if any
        super.init()
    }
    
    override func request<T: Decodable>(endPoint: APIEndpoint, responseType: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        if shouldSucceed {
            if let responseData = responseData {
                do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(T.self, from: responseData)
                    completion(.success(responseObject))
                } catch {
                    completion(.failure(.otherError(error)))
                }
            } else {
                completion(.failure(.noData))
            }
        } else {
            if let responseError = responseError {
                completion(.failure(.otherError(responseError)))
            } else {
                completion(.failure(.noData))
            }
        }
    }
}

