//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by Adrian Bilescu on 16.01.2024.
//

import Foundation
import Combine

class MoviesListViewModel: ObservableObject {
    @Published var list: [Movie] = []
    @Published var isLoading: Bool = false
    private var page: Int = 1
    
    private let useCase: FetchMoviePageUseCase
    private let dateFormatter = ISO8601DateFormatter()
    
    init(
        useCase: FetchMoviePageUseCase
    ) {
        self.useCase = useCase
    }
    
    @MainActor
    func viewDidLoad() {
        fetchNewPage()
    }
    
    @MainActor
    func didReachEndOfPage() {
        if isLoading {
            return
        }
        fetchNewPage()
    }
    
    @MainActor
    private func fetchNewPage() {
        Task {
            isLoading = true
            let fetchedList = try await useCase.fetch(
                page: page
            )
            list.append(
                contentsOf: fetchedList
            )
            page += 1
            isLoading = false
        }
    }
    
    func launchDateString(at index: Int) -> String {
        dateFormatter.string(from: list[index].launchDate)
    }
}
