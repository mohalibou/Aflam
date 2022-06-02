//
//  UpcomingMovieResults.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/30/22.
//

import Foundation

// MARK: - Welcome
struct UpcomingMovieResults: Codable {
    let page: Int
    let results: [Result]
    let dates: Dates
    let total_pages: Int
    let total_results: Int
}

// MARK: - Dates
struct Dates: Codable {
    let maximum: String
    let minimum: String
}
