//
//  FlickrDetailsComponents.swift
//  FlickrApp
//
//  Created by Vijaya Lakshmi on 9/14/24.
//

import SwiftUI

struct FlickrDetails: View {
    let itemViewModel: ItemViewModel
    let bounds = UIScreen.main.bounds
    var body: some View {
        VStack {
            AsyncImage(url:URL(string:itemViewModel.media.m)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: bounds.width)
            } placeholder: {
                ProgressView()
            }
            .padding(.bottom, 20)
            Text(itemViewModel.title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            VStack (alignment: .leading, spacing: 10) {
                Text(itemViewModel.tags)
                    .font(.headline)
                Text(itemViewModel.author)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 3)
                Text(itemViewModel.dateTaken)
                    .font(.headline)
            }
        }
    }
}

