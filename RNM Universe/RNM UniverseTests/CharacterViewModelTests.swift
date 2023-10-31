//
//  CharacterViewModelTests.swift
//  RNM UniverseTests
//
//  Created by Sona Maria Jolly on 29/10/23.
//

import XCTest
@testable import RNM_Universe

final class CharacterViewModelTests: XCTestCase {
    
    var characterViewModel: CharacterViewModel!
    let characters = [TestData.Characters.character1, TestData.Characters.character2]
    
    override func setUp() {
        super.setUp()
        characterViewModel = CharacterViewModel()
    }
    
    override func tearDown() {
        characterViewModel = nil
        super.tearDown()
    }
    
    func testNumberOfCharacters() {
        characterViewModel.characters = characters
        XCTAssertEqual(characterViewModel.numberOfCharacters(), 2, "Number of characters should match the array count")
    }
    
    func testCharacterAtIndex() {
        characterViewModel.characters = characters
        let character = characterViewModel.character(at: 1)
        XCTAssertEqual(character.name, "Morty Smith", "Character name should match the expected name")
    }
    
    func testFetchCharacters_Success() {
        let mockServiceManager = MockServiceManager()
        mockServiceManager.shouldSucceed = true
        let responseData = TestData.CharacterResponse.responseData
        mockServiceManager.responseData = responseData
        characterViewModel.serviceManager = mockServiceManager
        let expectation = XCTestExpectation(description: "Data retrieval expectation")
        characterViewModel.reloadCollectionView = {
            expectation.fulfill()
        }
        characterViewModel.requestCharacters()
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(characterViewModel.numberOfCharacters(), 2)
    }


    func testFetchCharacters_Failure() {
        let mockServiceManager = MockServiceManager()
        mockServiceManager.shouldSucceed = false
        let responseError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        mockServiceManager.responseError = responseError
        characterViewModel.serviceManager = mockServiceManager
        let expectation = XCTestExpectation(description: "Error message expectation")
        characterViewModel.showError = { message in
            XCTAssertEqual(message, "An error occurred: The operation couldn’t be completed. (TestErrorDomain error 123.)")
            expectation.fulfill()
        }
        characterViewModel.requestCharacters()
        wait(for: [expectation], timeout: 5.0)
    }

    func testPagination() {
            let mockServiceManager = MockServiceManager()
            mockServiceManager.shouldSucceed = true

            let firstPageData = TestData.CharacterResponse.responseData
            mockServiceManager.responseData = firstPageData

            characterViewModel.serviceManager = mockServiceManager

            let expectation1 = XCTestExpectation(description: "First page data retrieval expectation")
            characterViewModel.reloadCollectionView = {
                expectation1.fulfill()
            }
            characterViewModel.requestCharacters()
            wait(for: [expectation1], timeout: 5.0)

            XCTAssertEqual(characterViewModel.numberOfCharacters(), 2)

            let secondPageData = TestData.CharacterResponse.secondResponseData
            mockServiceManager.responseData = secondPageData

            let expectation2 = XCTestExpectation(description: "Second page data retrieval expectation")
            characterViewModel.reloadCollectionView = {
                expectation2.fulfill()
            }
            characterViewModel.loadNextBatchIfNeeded(for: IndexPath(row: 1, section: 0))
            wait(for: [expectation2], timeout: 5.0)

            XCTAssertEqual(characterViewModel.numberOfCharacters(), 4)
        }
}
