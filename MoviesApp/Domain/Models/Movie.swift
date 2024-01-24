//
//  Movie.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

struct Movie {
    typealias ID = String
    let id: ID
    let image: URL
    let name: String
    let launchDate: Date
}

