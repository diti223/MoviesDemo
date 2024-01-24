//
//  ContentView.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MoviesListViewModel
//    @StateObject var viewModel = MoviesListViewModel(useCase: PreviewFetchMoviePageUseCase())
    @State var text: String = ""
    
    var body: some View {
        List {
            ForEach(Array(viewModel.list.enumerated()), id: \.element.id) { (index, movie) in
                HStack {
                    AsyncImage(url: movie.image)
                    VStack {
                        Text(movie.name)
                        Text(viewModel.launchDateString(at: index))
                    }
                }
                .onAppear(perform: {
                    viewModel.didReachEndOfPage()
                })
            }
        }
        .onAppear(perform: {
            viewModel.viewDidLoad()
        })
    }
}

#Preview {
    ContentView(
        viewModel: MoviesListViewModel(
            useCase: PreviewFetchMoviePageUseCase()
        )
    )
}

struct PreviewFetchMoviePageUseCase: FetchMoviePageUseCase {
    func fetch(page: Int) async throws -> [Movie] {
        [
            Movie(
                id: "1",
                image: URL(string: "https://picsum.photos/200")!,
                name: "First Movie",
                launchDate: Date()
            )
        ]
    }
}
