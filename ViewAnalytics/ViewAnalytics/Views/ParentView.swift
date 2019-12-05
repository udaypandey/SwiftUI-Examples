//
//  ParentView.swift
//  ViewAnalytics
//
//  Created by Uday Pandey on 05/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct ParentView: View {
    let viewIdentifier: Int
    @Environment (\.analytics) var analytics: Analytics

    var body: some View {
        NavigationView {
            NavigationLink(destination: ChildView(viewIdentifier: viewIdentifier)) {
                Text("Dive In ...")
                    .font(.largeTitle)
                    .navigationBarTitle("Parent", displayMode: .inline)
            }
            .onAppear {
                self.analytics.track("Entering ParentView: \(self.viewIdentifier)")
            }
            .onDisappear {
                self.analytics.track("Leaving ParentView: \(self.viewIdentifier)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView(viewIdentifier: 1)
        .environment(\.analytics, Analytics())
    }
}
