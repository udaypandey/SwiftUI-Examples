//
//  LogoView.swift
//  LoginLayout
//
//  Created by Uday Pandey on 02/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.yellow)
                Rectangle()
                    .fill(Color.green)
            }

            HStack {
                Rectangle()
                    .fill(Color.red)
                Rectangle()
                    .fill(Color.blue)
            }
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
