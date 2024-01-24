//
//  FetchMovieDetailsUseCase.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

protocol FetchMovieDetailsUseCase {
    func fetch(id: Movie.ID) async throws -> MovieDetail
}
