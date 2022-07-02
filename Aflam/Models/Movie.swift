//
//  Movie.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/30/22.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String?
    //let belongs_to_collection: JSONNull?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdb_id: String?
    let original_language: String
    let original_title: String
    let overview: String?
    let popularity: Double
    let poster_path: String?
    let production_companies: [ProductionCompany]
    let production_countries: [ProductionCountry]
    let release_date: String
    let revenue: Int
    let runtime: Int?
    let spoken_languages: [SpokenLanguage]
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
    static var preview = Movie(adult: false,
                               backdrop_path: "",
                               budget: 69,
                               genres: [Genre(id: 1, name: "")],
                               homepage: "",
                               id: 69,
                               imdb_id: "",
                               original_language: "",
                               original_title: "",
                               overview: "Something happened and people did stuff.",
                               popularity: 6.9,
                               poster_path: "",
                               production_companies: [ProductionCompany(id: 1, logo_path: "hello", name: "hey", origin_country: "usa")],
                               production_countries: [ProductionCountry(iso_3166_1: "", name: "")],
                               release_date: "october",
                               revenue: 58,
                               runtime: 42,
                               spoken_languages: [SpokenLanguage(iso_639_1: "", name: "")],
                               status: "hello",
                               tagline: "hello",
                               title: "Shrek 5",
                               video: false,
                               vote_average: 6.9,
                               vote_count: 654)
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logo_path: String?
    let name: String
    let origin_country: String
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso_3166_1: String
    let name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let iso_639_1: String
    let name: String
}



/*
// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
*/
