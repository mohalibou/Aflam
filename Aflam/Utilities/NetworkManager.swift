//
//  NetworkManager.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    let apiKey = "MY_API_KEY"
    
    private init() {}
    
    func fetchTrendingMovies() async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&region=US&language=en-US&include_adult=false") else {
            print("Could not get trending movies.")
            throw NetworkError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(PopularMovieResults.self, from: data) {
                print("We got the trending movies.")
                return decodedResponse.results
            }
        } catch {
            print("Could not get trending movies.")
            throw NetworkError.genericError
        }
        throw NetworkError.genericError
    }
    
    func fetchUpcomingMovies() async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&region=US&language=en-US&include_adult=false") else {
            print("Could not get upcoming movies. 1")
            throw NetworkError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(UpcomingMovieResults.self, from: data) {
                print("We got the upcoming movies.")
                return decodedResponse.results
            }
        } catch {
            print("Could not get upcoming movies. 2")
            throw NetworkError.genericError
        }
        throw NetworkError.genericError
    }
    
    func fetchMovieDetails(id: Int) async throws -> Movie {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(id))?api_key=\(apiKey)&region=US&language=en-US") else {
            print("Could not get movie.")
            throw NetworkError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(Movie.self, from: data) {
                print("We got the movies.")
                return decodedResponse
            }
        } catch {
            print("Could not get movies.")
            throw NetworkError.genericError
        }
        throw NetworkError.genericError
    }
    
    //22582
    
    func fetchRecommendedMovies(id: Int) async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(id))/recommendations?api_key=\(apiKey)&language=en-US&page=1&include_adult=false") else {
            print("Could not get recommended movies.")
            throw NetworkError.genericError
        }
        
        print(String(id))
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(RecommendedMovieResults.self, from: data) {
                print("We got the recommended movies.")
                return decodedResponse.results
            }
        } catch {
            print("Could not get recommended movies.")
            throw NetworkError.genericError
        }
        throw NetworkError.genericError
    }
    
    func fetchMoviesSearch(search: String) async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(search)&page=1&include_adult=false") else {
            throw NetworkError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(RecommendedMovieResults.self, from: data) {
                return decodedResponse.results
            }
        } catch {
            throw NetworkError.genericError
        }
        throw NetworkError.genericError
    }
}

enum NetworkError: Error {
    case genericError
}
