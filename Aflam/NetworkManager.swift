//
//  NetworkManager.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    let apiKey = "061fad8adc76b5a597be1d972fff053e"
    
    private init() {}
    
    func fetchPopularMovies() async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1") else {
            print("Could not get trending movies.")
            throw AError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(PopularMovieResults.self, from: data) {
                print("We got the trending movies.")
                return decodedResponse.results
            }
        } catch {
            print("Could not get trending movies.")
            throw AError.genericError
        }
        throw AError.genericError
    }
    
    func fetchUpcomingMovies() async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=en-US&page=1") else {
            print("Could not get upcoming movies.")
            throw AError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(UpcomingMovieResults.self, from: data) {
                print("We got the upcoming movies.")
                return decodedResponse.results
            }
        } catch {
            print("Could not get upcoming movies.")
            throw AError.genericError
        }
        throw AError.genericError
    }
    
    func fetchMovieDetails(id: Int) async throws -> Movie {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(id))?api_key=\(apiKey)&language=en-US") else {
            print("Could not get movie.")
            throw AError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(Movie.self, from: data) {
                print("We got the movies.")
                return decodedResponse
            }
        } catch {
            print("Could not get movies.")
            throw AError.genericError
        }
        throw AError.genericError
    }
    
    func fetchRecommendedMovies(id: Int) async throws -> [Result] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(id))/recommendations?api_key=\(apiKey)&language=en-US&page=1") else {
            print("Could not get recommended movies.")
            throw AError.genericError
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode(RecommendedMovieResults.self, from: data) {
                print("We got the recommended movies.")
                return decodedResponse.results
            }
        } catch {
            print("Could not get recommended movies.")
            throw AError.genericError
        }
        throw AError.genericError
    }
}
