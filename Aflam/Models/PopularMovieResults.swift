//
//  TrendingMovie.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import Foundation

struct PopularMovieResults: Codable {
    let page: Int
    let results: [Result]
    let total_pages: Int
    let total_results: Int
}
