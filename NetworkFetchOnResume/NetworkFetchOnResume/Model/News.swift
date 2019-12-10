//
//  News.swift
//  NetworkFetchOnResume
//
//  Created by Uday Pandey on 10/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import Combine
import UIKit

struct Article: Decodable {
    var title: String

    private enum CodingKeys: String, CodingKey {
        case title
    }
}

struct News: Decodable {
    let articles: [Article]

    private enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}

class NewsModel: ObservableObject {
    @Published var news: News
    @Published var refreshModel = true

    let notificationPublisher = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)

    private var cancellables: Set<AnyCancellable> = Set([])

    init(news: News) {
        self.news = news

        $refreshModel
            .dropFirst()
            .map { elm -> URL in
                switch elm {
                case true:
                    return URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=1bb598e1234545d99dec325f15a773b1")!
                case false:
                    return URL(string: "https://newsapi.org/v2/top-headlines?country=de&apiKey=1bb598e1234545d99dec325f15a773b1")!
                }
            }
//            .print()
            .flatMap { url -> AnyPublisher<News, Never> in
                let publisher = URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: News.self, decoder: JSONDecoder())
//                    .print()
                    .eraseToAnyPublisher()
//                    .print()
                    .catch { error in
                        Just(NewsModel.sampleMovies)
                }
                .eraseToAnyPublisher()

                return publisher
            }
            .receive(on: DispatchQueue.main)
//            .print()
            .assign(to: \.news, on: self)
            .store(in: &cancellables)
    }

    func refresh() {
        refreshModel.toggle()
    }
}


extension NewsModel {
    static var sampleMovies: News {
        let articles: [Article] = [
        ]

        return News(articles: articles)
    }
}
