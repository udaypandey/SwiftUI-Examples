//
//  ContentView.swift
//  WrapView
//
//  Created by Uday Pandey on 06/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            RectangleView(color: UIColor.clear)
                .background(Color.yellow)
                .frame(width: 100, height: 200)
            
            Text("Hello, World!")

            RectangleView(color: UIColor.green)
                .frame(width: 100, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
