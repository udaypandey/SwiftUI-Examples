//
//  MovieListView.swift
//  NetworkFetch
//
//  Created by Uday Pandey on 03/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var model: MovieModel

    var body: some View {
        NavigationView {
            List (model.movies.movies, id: \.id) { movie in
                NavigationLink(destination: Text("\(movie.title)")) {
                    Text("\(movie.title)")
                }
            }
            .navigationBarTitle("Movies")
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

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        let movieModel = MovieModel(movies: Movies(movies: []))

        return MovieListView(model: movieModel)
    }
}
