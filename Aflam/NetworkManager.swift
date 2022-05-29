//
//  NetworkManager.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import Foundation

final class NetworkManager {
    
    func fetchTrendingMovies() {
        
        guard let url = URL(string: "https://api.trakt.tv/movies/trending") else {
            print("Could not get trending movies.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode()
        }
    }
    
}
