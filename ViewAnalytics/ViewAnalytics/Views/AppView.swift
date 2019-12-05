//
//  AppView.swift
//  ViewAnalytics
//
//  Created by Uday Pandey on 05/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ParentView(viewIdentifier: 1)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Parent 1")
                }

            ParentView(viewIdentifier: 2)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Parent 2")
                }

            ParentView(viewIdentifier: 3)
                .tabItem {
                    Image(systemName: "tray")
                    Text("Parent 3")
                }

            ParentView(viewIdentifier: 4)
                .tabItem {
                    Image(systemName: "trash")
                    Text("Parent 4")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
