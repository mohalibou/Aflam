//
//  Movie.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: Int
    let ids: IDS
}

struct IDS: Codable {
    let trakt: Int
    let slug, imdb: String
    let tmdb: Int
}
