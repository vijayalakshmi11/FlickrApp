//
//  FlickrModelTests.swift
//  FlickrAppTests
//
//  Created by Vijaya Lakshmi on 9/14/24.
//

import XCTest
@testable import FlickrApp
final class FlickrModelTests: XCTestCase {

    let mockWebService = MockWebService()
    func testPopulateRecipesListSuccess() async {
        let expectedDetails = Item(title: "Sleeping Pincushon", link: "https:/www.flickr.com/photos", media: Media(m: "https://live.staticflickr.com/65535/53988888706_b368cb9958_m.jpg"), date_taken: "2024-09-10T13:17:47-08:00", description: "A porcupine takes an afternoon nap at the National Zoo", published: "2024-09-12T01:56:07Z", author: "nobody@flickr.com", author_id: "199973440@N02", tags: "sleep 665nm cute zoo wildlife infrared porcupine animal")
        let response = FlickrModel(title: "Recent Uploads tagged porcupine", link: "https:/www.flickr.com/photos/tags/porcupine/", description: "", modified: "2024-09-12T01:56:07Z", generator: "https:/www.flickr.com", items: [expectedDetails])
        mockWebService.response = try? JSONEncoder().encode(response)
        let viewModel = FlickrViewModel(webService: mockWebService)
        await viewModel.populateFlickrUploads(name: "")
        XCTAssertEqual(viewModel.itemsList.count, 1)
        XCTAssertEqual(viewModel.itemsList.first?.link, expectedDetails.link)
        XCTAssertEqual(viewModel.itemsList.first?.title, expectedDetails.title)
    }
    func testPopulateRecipeDetailsFailure() async {
        mockWebService.error = URLError(.notConnectedToInternet)
        let viewModel = FlickrViewModel(webService: mockWebService)
        await viewModel.populateFlickrUploads(name: "")
        XCTAssertTrue(viewModel.itemsList.isEmpty)
    }
}
