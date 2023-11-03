//
//  CharacterViewModel.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import Foundation

class CharacterViewModel {
    var characters: [Character] = [] {
        didSet {
            self.reloadCollectionView?()
        }
        
    }
    var reloadCollectionView: (()->())?
    var showError: ((_ message: String)->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    var navigateToDetail: ((Character) -> Void)?
    var serviceManager: ServiceManager = ServiceManager.shared
    private var currentPage: Int = 1
    private var isFetchingData: Bool = false
    private var totalPages: Int = 0
    
    ///Request characters from API
    func requestCharacters() {
        guard !isFetchingData else {
            return
        }

        self.showLoading?()
        isFetchingData = true
        serviceManager.request(endPoint: .getCharacters(page: currentPage), responseType: Item.self) { result in
            print("Current Page", self.currentPage)
            self.hideLoading?()
            self.isFetchingData = false
            switch result {
            case .success(let response):
                if response.results.count > 0 {
                    self.characters.append(contentsOf: response.results)
                    self.saveCharactersToFile(characters: self.characters)
                    self.totalPages = response.info.pages
                }
            case .failure(let error):
                self.fetchCharactersFromFile()
                self.showError?(error.errorMessage)
            }
        }
    }
        
    ///if there is any service error show data saved in file.
    func fetchCharactersFromFile() {
        // Retrieve data from the file
        if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("characters.json") {
            if let data = try? Data(contentsOf: fileURL) {
                do {
                    let characters = try JSONDecoder().decode([Character].self, from: data)
                    self.characters = characters
                } catch {
                    print("Error decoding characters response from file: \(error)")
                }
            }
        }
    }
    
    /// Save fetched data from API to file.
    /// So, when app goes offline after previously accessing the network, it can show previously loaded results.
    func saveCharactersToFile(characters: [Character]) {
        do {
            let data = try JSONEncoder().encode(characters)
            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("characters.json") {
                try data.write(to: fileURL)
            }
        } catch {
            print("Error saving character response to file: \(error)")
        }
    }
    
    // Returns the count of characters
    func numberOfCharacters() -> Int {
        return characters.count
    }
    
    //Returns the character at specific index
    func character(at index: Int) -> Character {
        return characters[index]
    }
    
    // Function to load the next batch of data if needed
    func loadNextBatchIfNeeded(for indexPath: IndexPath) {
        if currentPage < totalPages {
            self.currentPage += 1
            self.requestCharacters()
        }
    }
}

