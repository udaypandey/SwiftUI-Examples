//
//  ContentView.swift
//  GeometryReader
//
//  Created by Uday Pandey on 06/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct MyTopAlignmentID: AlignmentID {
    static func dumpViewDimension(context: ViewDimensions) {
        print("====== Start ======")
        print("ViewDimensions: width:\(context.width)")
        print("ViewDimensions: height:\(context.height)")

        print("ViewDimensions: top:\(context[VerticalAlignment.top])")
        print("ViewDimensions: bottom:\(context[VerticalAlignment.bottom])")
        print("ViewDimensions: center:\(context[VerticalAlignment.center])")
        print("======= End =====")

    }

    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        dumpViewDimension(context: context)

        return context[VerticalAlignment.center]
    }
}

extension VerticalAlignment {
    static var middle: VerticalAlignment {
        VerticalAlignment(MyTopAlignmentID.self)
    }
}



struct ContentView: View {
    var body: some View {
        HStack(alignment: .middle) {
            CustomView()

            Text("Hello, World!")

            Image(systemName: "camera")
            
            CustomView()

            Text("Hello, World!")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
