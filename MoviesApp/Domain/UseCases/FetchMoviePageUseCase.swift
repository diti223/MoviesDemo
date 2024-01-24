//
//  FetchMoviesUseCase.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

protocol FetchMoviePageUseCase {
    func fetch(page: Int) async throws -> [Movie]
}

struct ContentNotFoundException: Error {}
