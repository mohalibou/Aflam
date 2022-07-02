//
//  MovieScrollView.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 6/2/22.
//

import SwiftUI

struct MoviesScrollView: View {
    
    @Binding var movies: [Result]
    var movieListType: String
    
    var body: some View {
        VStack {
            HStack {
                Text(movieListType)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    if (movies.count != 0) {
                        ForEach(movies, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailView(movieID: movie.id)) {
                                PosterView(movie: movie)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    } else {
                        PosterView(movie: Result(id: 0, title: "", poster_path: ""))
                    }
                }
                .padding(.leading)
                .padding(.trailing)
            }
        }
        .padding(.top)
        .task {
            do {
                if (movieListType == "Trending Movies") {
                    movies = try await NetworkManager.shared.fetchTrendingMovies()
                } else if (movieListType == "Upcoming Movies") {
                    movies = try await NetworkManager.shared.fetchUpcomingMovies()
                }
            } catch {
                
            }
        }
    }
}

/*
struct MovieScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MovieScrollView()
    }
}
*/
