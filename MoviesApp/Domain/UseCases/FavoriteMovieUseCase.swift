//
//  FavoriteMovieUseCase.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

protocol FavoriteMovieUseCase {
    func favorite(id: Movie.ID) async throws
    func unfavorite(id: Movie.ID) async throws 
}
