//
//  List.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

protocol FetchFavoriteMoviesUseCase {
    func fetchFavorites() -> [Movie]
}
