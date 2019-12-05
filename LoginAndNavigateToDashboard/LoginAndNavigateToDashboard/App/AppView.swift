//
//  AppView.swift
//  LoginAndNavigateToDashboard
//
//  Created by Uday Pandey on 04/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var model: AppViewModel

    var body: some View {
        Group {
            if model.state == .willLogin {
                LoginView()
            } else {
                DashboardView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(AppViewModel())
    }
}
