//
//  InMemoryFetchMoviePageUseCase.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation

class InMemoryFetchMoviePageUseCase: FetchMoviePageUseCase, FavoriteMovieUseCase, FetchFavoriteMoviesUseCase {
    
    
    private var list = [
        Movie(id: "1", image: URL(string: "https://picsum.photos/200")!, name: "First Movie", launchDate: Date()),
        Movie(id: "2", image: URL(string: "https://picsum.photos/200")!, name: "Second Movie", launchDate: Date()),
        Movie(id: "3", image: URL(string: "https://picsum.photos/200")!, name: "Third Movie", launchDate: Date())
    ]
    
    private var favoriteIds: Set<Movie.ID> = []
    
    func fetch(page: Int) async throws -> [Movie] {
        list
    }
    
    func favorite(id: Movie.ID) async throws {
        favoriteIds.insert(id)
    }
    func unfavorite(id: Movie.ID) async throws {
        favoriteIds.remove(id)
    }
    
    func fetchFavorites() -> [Movie] {
        list.filter { favoriteIds.contains($0.id) }
    }
}
