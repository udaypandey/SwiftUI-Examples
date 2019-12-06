//
//  CustomView.swift
//  GeometryReader
//
//  Created by Uday Pandey on 06/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        GeometryReader { geometry in
//            ZStack {
//                Image(systemName: "camera")
//                    .font(.largeTitle)
//            }
//            .background(Color.red)


            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
            }
            .background(Color.red)
        }
        .background(Color.green)
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
