//
//  ChildView.swift
//  ViewAnalytics
//
//  Created by Uday Pandey on 05/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    let viewIdentifier: Int
    @Environment (\.analytics) var analytics: Analytics


    var body: some View {
        NavigationLink(destination: GrandChildView(viewIdentifier: viewIdentifier)) {
            Text("Dive In ...")
                .font(.largeTitle)
                .navigationBarTitle("Child", displayMode: .inline)
        }
        .onAppear {
            self.analytics.track("Entering ChildView: \(self.viewIdentifier)")
        }
        .onDisappear {
            self.analytics.track("Leaving ChildView: \(self.viewIdentifier)")
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChildView(viewIdentifier: 1)
            .environment(\.analytics, Analytics())

        }
    }
}
