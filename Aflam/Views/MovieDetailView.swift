//
//  MovieDetailView.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 6/1/22.
//

import SwiftUI

struct MovieDetailView: View {    
    var movieID: Int
    @State private var movie: Movie?
    @State private var recommendedMovies = [Result]()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1280" + (movie?.poster_path ?? "")),
                               content: { image in
                                   image.resizable()
                                        .scaledToFill()
                                        .frame(width: 160, height: 240)
                                        .cornerRadius(10)
                               },
                               placeholder: { ProgressView()
                                                .frame(width: 160, height: 240)
                                                .background(Color.gray)
                                                .cornerRadius(10) })
                    VStack(alignment: .leading, spacing: 10) {
                        Text(movie?.title ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Movie Length: ")
                            .foregroundColor(.secondary)
                            .font(.caption)
                        + Text("\(movie?.runtime ?? 0) minutes")
                            .foregroundColor(.secondary)
                        Text("Release Date: ")
                            .foregroundColor(.secondary)
                            .font(.caption)
                        + Text("\(movie?.release_date ?? "")")
                            .foregroundColor(.secondary)
                        VoterScoreView(voteAverage: movie?.vote_average ?? 0.0)
                        Spacer()
                    }
                    .padding(5)
                    Spacer()
                }
                .padding()
                SynopsisView(synopsis: movie?.overview ?? "")
                MoviesScrollView(movies: $recommendedMovies, movieListType: "Recommended Movies")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                movie = try await NetworkManager.shared.fetchMovieDetails(id: movieID)
                recommendedMovies = try await NetworkManager.shared.fetchRecommendedMovies(id: movieID)
            } catch {
                
            }
        }
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieID: 526896)
    }
}


struct VoterScoreView: View {
    
    var voteAverage: Double
    var color: Color {
        if (voteAverage < 4) {
            return Color.red
        } else if (voteAverage < 7) {
            return Color.yellow
        } else {
            return Color.green
        }
    }
    
    var body: some View {
        if (voteAverage != 0) {
            ZStack {
                color
                    .opacity(0.2)
                VStack(spacing: 10) {
                    
                    Text("Voter Score")
                        .foregroundColor(color)
                        .fontWeight(.bold)
                    Text("\(voteAverage, specifier: "%.1f")")
                        .foregroundColor(color)
                        .fontWeight(.bold)
                        .font(.title)
                }
            }
            .frame(maxWidth: 190, maxHeight: 100)
            .cornerRadius(10)
        }
    }
}

struct SynopsisView: View {
    
    var synopsis: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Synopsis")
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            Text(synopsis)
                .padding(.leading)
                .padding(.trailing)
                .padding(.top, 1)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.quaternaryLabel))
        .cornerRadius(10)
        .padding()
    }
}
