//
//  ContentView.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var popularMovies = [Result]()
    @State private var upcomingMovies = [Result]()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    MoviesScrollView(movies: $popularMovies, movieListType: "Popular Movies")
                    MoviesScrollView(movies: $upcomingMovies, movieListType: "Upcoming Movies")
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
