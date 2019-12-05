//
//  GrandChildView.swift
//  ViewAnalytics
//
//  Created by Uday Pandey on 05/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct GrandChildView: View {
    let viewIdentifier: Int
    @Environment (\.analytics) var analytics: Analytics

    var body: some View {
        Text("Grand Child ...")
            .font(.largeTitle)
            .navigationBarTitle("Grand child", displayMode: .inline)
            .onAppear {
                self.analytics.track("Entering GrandChildView: \(self.viewIdentifier)")
            }
            .onDisappear {
                self.analytics.track("Leaving GrandChildView: \(self.viewIdentifier)")
            }
    }
}

struct GrandChildView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GrandChildView(viewIdentifier: 1)
            .environment(\.analytics, Analytics())

        }
    }
}
