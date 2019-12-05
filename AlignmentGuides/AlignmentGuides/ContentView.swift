//
//  ContentView.swift
//  AlignmentGuides
//
//  Created by Uday Pandey on 05/12/2019.
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

        return context[.top]
    }
}

extension VerticalAlignment {
    static var topper: VerticalAlignment {
        VerticalAlignment(MyTopAlignmentID.self)
    }
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .topper) {
            Rectangle()
                .fill(Color.red)
            .frame(width: 100, height: 100)
            .alignmentGuide(.topper) { d in d[.bottom] }


            Text("Hello world")
                .alignmentGuide(.topper) { d in d[.top] }

            Text("Hello universe")
                .alignmentGuide(.topper) { d in d[.top] }

            Rectangle()
                .fill(Color.green)
            .frame(width: 100, height: 150)
            .alignmentGuide(.topper) { d in d[.top] }


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
