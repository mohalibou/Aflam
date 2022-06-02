//
//  RecommendedMovieResults.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 6/2/22.
//

import Foundation

struct RecommendedMovieResults: Codable {
    let page: Int
    let results: [Result]
    let total_pages: Int
    let total_results: Int
}
