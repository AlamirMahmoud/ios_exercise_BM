import Foundation

protocol MoviesResponseStorage {
    func getResponse(
        for request: MoviesRequestDTO,
        completion: @escaping (Result<MoviesResponsesDTO?, Error>) -> Void
    )
    func save(response: MoviesResponsesDTO, for requestDto: MoviesRequestDTO)
}
