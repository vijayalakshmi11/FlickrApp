//
//  FlickrModel.swift
//  FlickrApp
//
//  Created by Vijaya Lakshmi on 9/13/24.
//

import Foundation
// MARK: - Welcome
struct FlickrModel: Codable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let media: Media
    let date_taken: String
    let description: String
    let published: String
    let author: String
    let author_id: String
    let tags: String
}

// MARK: - Media
struct Media: Codable {
    let m: String
}
