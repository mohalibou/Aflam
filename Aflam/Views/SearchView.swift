//
//  SearchView.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 6/2/22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var movies = [Result]()
    
    var body: some View {
        NavigationView {
            List(movies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(movieID: movie.id)) {
                    Text(movie.title)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .navigationTitle("Search")
            .onChange(of: searchText) { searchText in
                Task.init { await search() }
            }
        }
    }
    
    func search() async {
        do {
            movies = try await NetworkManager.shared.fetchMoviesSearch(search: searchText.replacingOccurrences(of: " ", with: "%20"))
        } catch {
            print("error")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
