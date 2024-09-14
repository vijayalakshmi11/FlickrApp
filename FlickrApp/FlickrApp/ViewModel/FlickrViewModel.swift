//
//  FlickrViewModel.swift
//  FlickrApp
//
//  Created by Vijaya Lakshmi on 9/13/24.
//

import Foundation

class FlickrViewModel: ObservableObject {
    private let webService: WebServiceProtocol
    init(webService: WebServiceProtocol = Webservice()) {
        self.webService = webService
    }
    @Published var itemsList: [ItemViewModel] = []

    func populateFlickrUploads(name: String) async {
        do {
            let flickerDetails =  try await webService.get(url: Constants.flickrByName(name)) { data in
               return try? JSONDecoder().decode(FlickrModel.self, from: data)
            }
            self.itemsList = flickerDetails.items.map(ItemViewModel.init) 
        } catch {
            print(error)
        }
    }
}

struct ItemViewModel: Identifiable {
    private let item: Item
    init(item: Item) {
        self.item = item
    }
    var id = UUID()
    var title: String {
        item.title
    }
    var link: String {
        item.link
    }
    var media: Media {
       item.media
    }
    var dateTaken: String {
        item.date_taken
    }
    var description: String {
        item.description
    }
    var published: String {
        item.published
    }
    var author: String {
        item.author
    }
    var authorID: String {
        item.author_id
    }
    var tags: String {
        item.tags
    }
}
