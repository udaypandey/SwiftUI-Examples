//
//  Movie.swift
//  NetworkFetch
//
//  Created by Uday Pandey on 03/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import Combine

struct Movie: Decodable, Identifiable {
    var id: Int
    var title: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Movies: Decodable {
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

class MovieModel: ObservableObject {
    @Published var movies: Movies
    @Published var refreshModel = true

    private var cancellables: Set<AnyCancellable> = Set([])

    init(movies: Movies) {
        self.movies = movies

        $refreshModel
            .map { elm -> URL in
                switch elm {
                case true:
                    return URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=98636ae5f789f9987b38e54a8aa57de7")!
                case false:
                    return URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity&api_key=98636ae5f789f9987b38e54a8aa57de7")!
                }
            }
            //.print()
            .flatMap { url -> AnyPublisher<Movies, Never> in
                let publisher = URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: Movies.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
                    .print()
                    .catch { error in
                        Just(MovieModel.sampleMovies)
                }
                .eraseToAnyPublisher()

                return publisher
            }
            .receive(on: DispatchQueue.main)
            //.print()
            .assign(to: \.movies, on: self)
            .store(in: &cancellables)
    }

    func refresh() {
        refreshModel.toggle()
    }
}


extension MovieModel {
    static var sampleMovies: Movies {
        let movies: [Movie] = [
        ]

        return Movies(movies: movies)
    }
}
