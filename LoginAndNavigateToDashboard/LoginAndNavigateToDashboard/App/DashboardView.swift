//
//  DashboardView.swift
//  LoginAndNavigateToDashboard
//
//  Created by Uday Pandey on 04/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var model: AppViewModel

    var body: some View {
        Button(action: {
            self.model.state = .willLogin
        }) {
            Text("Logout")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView().environmentObject(AppViewModel())
    }
}
