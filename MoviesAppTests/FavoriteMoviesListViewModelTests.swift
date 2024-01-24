//
//  MoviesAppTests.swift
//  MoviesAppTests
//
//  Created by Adrian Bilescu on 17.01.2024.
//

import XCTest
@testable import MoviesApp

class FavoriteMoviesListViewModel {
    var list: [Movie] = []
    var isLoading = false
    let useCase: FetchFavoriteMoviesUseCase
    
    init(useCase: FetchFavoriteMoviesUseCase) {
        self.useCase = useCase
    }
    
    func viewDidAppear() {
        isLoading = true
        _ = useCase.fetchFavorites()
    }
}

// favorite list
final class FavoriteMoviesListViewModelTests: XCTestCase {
    // Ideally test public interface - because the testing suite/class is the client of your component
    
    // 0. on init list is empty
    // 1. on appear - fetch list - first page
    //      - success
    //      - failure
    // 2. favorite movie at index - invokes favorite use case
        
    func testOnInit() {
        let sut = makeSUT()
        
        XCTAssertTrue(sut.list.isEmpty)
        XCTAssertFalse(sut.isLoading)
    }
    
    func testOnAppear_StartLoading() {
        // given - setup
        let sut = makeSUT()
        
        // when - action
        sut.viewDidAppear()
        
        // then - assert
        XCTAssertTrue(sut.isLoading)
    }
    
    func testOnAppear_FetchListOfFavorites() {
        // given - setup
        let spy = SpyFetchFavoriteMoviesUseCase()
        let sut = makeSUT(useCase: spy)
        
        // when - action
        sut.viewDidAppear()
        
        // then - assert
        XCTAssertEqual(spy.invokedFetchCount, 1)
    }
    
    // Test Doubles: spy, stub, dummy, mock
    
    private func makeSUT(useCase: FetchFavoriteMoviesUseCase = SpyFetchFavoriteMoviesUseCase()) -> FavoriteMoviesListViewModel {
        FavoriteMoviesListViewModel(useCase: useCase)
    }
}


class SpyFetchFavoriteMoviesUseCase: FetchFavoriteMoviesUseCase {
    var invokedFetchCount = 0
    func fetchFavorites() -> [Movie] {
        invokedFetchCount += 1
        return []
    }
    
}
