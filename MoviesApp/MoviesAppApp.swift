//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    var useCase = InMemoryFetchMoviePageUseCase()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MoviesListViewModel(useCase: useCase))
        }
    }
}


