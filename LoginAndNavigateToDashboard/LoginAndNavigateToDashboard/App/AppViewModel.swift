//
//  AppViewModel.swift
//  LoginAndNavigateToDashboard
//
//  Created by Uday Pandey on 04/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    @Published var state: State = .willLogin

    enum State {
        case willLogin
        case didLogin
    }
}
