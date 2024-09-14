//
//  Constants.swift
//  FlickrApp
//
//  Created by Vijaya Lakshmi on 9/13/24.
//

import Foundation

struct Constants {
    static func flickrByName(_ name: String) -> URL{
        return URL(string:"https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(name)")!
    }
    static let defaultName = "porcupine"
    static let recentUploads = "Recent Uploads"

}
