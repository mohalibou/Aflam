//
//  Movie.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/29/22.
//

import Foundation

struct Result: Codable {
    let id: Int
    let title: String
    let poster_path: String?
    
    static var preview = Result(id: 69,
                                title: "Popular Movie",
                                poster_path: "/zT5ynZ0UR6HFfWQSRf2uKtqCyWD.jpg")
}
