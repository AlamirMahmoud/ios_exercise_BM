//
//  UpComingMoviesUseCase.swift
//  ios_exercise
//
//  Created by admin on 20/04/2024.
//

import Foundation

protocol UpComingMoviesUseCase {
    func execute(
        requestValue: UpComingMoviesUseCaseRequestValue,
        cached: @escaping (MoviesPage) -> Void,
        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable?
}

final class DefaultUpComingMoviesUseCase: UpComingMoviesUseCase {

    private let moviesRepository: MoviesRepository
    private let moviesQueriesRepository: MoviesQueriesRepository

    init(
        moviesRepository: MoviesRepository,
        moviesQueriesRepository: MoviesQueriesRepository
    ) {

        self.moviesRepository = moviesRepository
        self.moviesQueriesRepository = moviesQueriesRepository
    }

    func execute(
        requestValue: UpComingMoviesUseCaseRequestValue,
        cached: @escaping (MoviesPage) -> Void,
        completion: @escaping (Result<MoviesPage, Error>) -> Void
    ) -> Cancellable? {

        return moviesRepository.fetchCustomMoviesList(
            page: requestValue.page,
            type: .upcoming,
            cached: cached,
            completion: { result in

            if case .success = result {
                self.moviesQueriesRepository.saveRecentQuery(query: requestValue.query) { _ in }
            }

            completion(result)
        })
    }
}

struct UpComingMoviesUseCaseRequestValue {
    let query: MovieQuery
    let page: Int
}
