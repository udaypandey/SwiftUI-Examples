//
//  LoginViewModel.swift
//  LoginLayout
//
//  Created by Uday Pandey on 02/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    // Input
    @Published var userName = ""
    @Published var password = ""

    // Output
    var canLogin = false
    
    private var cancellables: Set<AnyCancellable> = Set([])

    init() {
        let userNameValidation = $userName
            .removeDuplicates()
            .map { $0.count > 3 ? true: false }

        let passwordValidation = $password
            .removeDuplicates()
            .map { $0.count > 3 ? true: false }

        Publishers.CombineLatest(userNameValidation, passwordValidation)
            .map { $0 && $1 }
            .assign(to: \.canLogin, on: self)
            .store(in: &cancellables)
    }
}

