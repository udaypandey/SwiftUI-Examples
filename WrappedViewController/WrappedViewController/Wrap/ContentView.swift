//
//  ContentView.swift
//  WrappedViewController
//
//  Created by Uday Pandey on 06/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SimplePageViewController()

            HybridPageViewController()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
