//
//  ContentView.swift
//  NetworkFetchOnResume
//
//  Created by Uday Pandey on 10/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var model: NewsModel

    var body: some View {
        NavigationView {
            List (model.news.articles, id: \.title) { article in
                NavigationLink(destination: Text("\(article.title)")) {
                    Text("\(article.title)")
                }
            }
            .onReceive(model.notificationPublisher) { publisher in
                self.refresh()
            }
            .navigationBarTitle("News")
            .navigationBarItems(trailing:
                Button(action: refresh) {
                    Image(systemName: "gobackward")
                }
            )
        }
    }

    func refresh() {
        self.model.refreshModel.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let newsModel = NewsModel(news: News(articles: []))

        return NewsListView(model: newsModel)
    }
}


