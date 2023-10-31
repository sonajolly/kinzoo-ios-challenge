//
//  CharacterViewControllerUITests.swift
//  RNM UniverseUITests
//
//  Created by Sona Maria Jolly on 31/10/23.
//

import XCTest

final class CharacterViewControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterListDisplay() {
        XCTAssertTrue(app.staticTexts["Characters"].exists)
        XCTAssertTrue(app.collectionViews.cells.count > 0)
    }
    
    func testCharacterDetailNavigation() {
        app.collectionViews.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["Info"].exists)
    }
}
