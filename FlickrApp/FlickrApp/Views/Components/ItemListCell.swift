//
//  ItemListCell.swift
//  FlickrApp
//
//  Created by Vijaya Lakshmi on 9/13/24.
//

import SwiftUI

struct ItemListCell: View {
        let itemViewModel: ItemViewModel
        var body: some View {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string:itemViewModel.media.m)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 160, maxHeight: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.black.opacity(0.3), radius: 15,x: 0,y: 10)
                        .overlay(alignment:.bottom) {
                            VStack {
                                Text(itemViewModel.title)
                                    .font(.headline)
                            }
                                
                        } .foregroundColor(.white)
                        .shadow(color:.black,radius: 3,x: 0,y: 0)
                        .padding()
                        .accessibilityIdentifier("loadedImage")
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 270)
                        .foregroundColor(.gray)
                        .overlay(alignment:.bottom) {
                            Text(itemViewModel.title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 3,x: 0,y: 0)
                                .frame(maxWidth:136)
                                .padding()
                                .accessibilityIdentifier("title")
                        }
                        .accessibilityIdentifier("placeholderImage")

                }
            }
        }
}
