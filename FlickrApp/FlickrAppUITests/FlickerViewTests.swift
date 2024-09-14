//
//  FlickerViewTests.swift
//  FlickrAppUITests
//
//  Created by Vijaya Lakshmi on 9/14/24.
//

import XCTest

final class FlickerViewTests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
               app = XCUIApplication()
               app.launch()
    }
    func testSearchFlickrUploads() throws {
            XCTAssertTrue(app.otherElements["recentUploads"].exists, "The Recent Uploads view should exist.")
            
            let searchField = app.searchFields["Enter Text"]
            XCTAssertTrue(searchField.exists, "The search bar should exist.")
            
            searchField.tap()
            searchField.typeText("Nature")

            app.buttons["Search"].tap()

            let expectation = expectation(description: "Wait for search results")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // wait for 2 seconds for async task to complete
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 3)

            let firstItem = app.otherElements["itemCell"].firstMatch
            XCTAssertTrue(firstItem.exists, "At least one search result should be visible after performing the search.")
        }
    func testNavigateToDetailsView() throws {
            let firstItem = app.otherElements["itemCell"].firstMatch
            XCTAssertTrue(firstItem.exists, "There should be an item to tap on.")
            firstItem.tap()
            let detailView = app.otherElements["itemDetailView"]
            XCTAssertTrue(detailView.exists, "The detail view should appear when tapping on an item.")
        }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
