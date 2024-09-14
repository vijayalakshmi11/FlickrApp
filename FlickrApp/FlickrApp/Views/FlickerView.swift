//
//  ContentView.swift
//  FlickrApp
//
//  Created by Vijaya Lakshmi on 9/13/24.
//

import SwiftUI

struct FlickerView: View {
    @StateObject private var model = FlickrViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)], spacing: 15) {
                    ForEach(model.itemsList) { item in
                        NavigationLink(destination: FlickrDetails(itemViewModel: item)){ 
                        ItemListCell(itemViewModel: item)
                            .accessibilityIdentifier("itemCell")
                         }
                    }
                }.task {
                    await populateFlickrUploads(name: Constants.defaultName)
                }
            }
            .navigationTitle(Constants.recentUploads)
            .searchable(text: $searchText, prompt: "Enter Text").onSubmit(of: .search) {
                Task {
                    await populateFlickrUploads(name:searchText)
                }
            }
            .accessibilityIdentifier("recentUploads")
        }
        .navigationViewStyle(.stack)
    }
    func populateFlickrUploads(name: String) async {
        await model.populateFlickrUploads(name: name)

    }
}
#Preview {
    FlickerView()
}
