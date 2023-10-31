//
//  CharacterDetailViewControllerUITests.swift
//  RNM UniverseUITests
//
//  Created by Sona Maria Jolly on 31/10/23.
//

import XCTest

final class CharacterDetailViewControllerUITests: XCTestCase {

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

        func testCharacterDetailDisplay() {
            app.collectionViews.cells.element(boundBy: 0).tap()
            XCTAssertTrue(app.staticTexts["Info"].exists)
            XCTAssertTrue(app.staticTexts["characterName"].exists)
            XCTAssertTrue(app.staticTexts["Status"].exists)
            XCTAssertTrue(app.staticTexts["characterStatus"].exists)
            XCTAssertTrue(app.staticTexts["Species"].exists)
            XCTAssertTrue(app.staticTexts["characterSpecies"].exists)
            XCTAssertTrue(app.staticTexts["Gender"].exists)
            XCTAssertTrue(app.staticTexts["characterGender"].exists)
            XCTAssertTrue(app.staticTexts["characterCreatedAt"].exists)
            XCTAssertTrue(app.staticTexts["characterLocation"].exists)
            XCTAssertTrue(app.staticTexts["characterOrigin"].exists)
        }
    }
