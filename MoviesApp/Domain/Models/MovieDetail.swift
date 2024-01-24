//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

struct MovieDetail {
    let image: URL
    let name: String
    let description: String
    let actors: [MovieActor]
    let launchDate: Date
    
    let budget: String
}
