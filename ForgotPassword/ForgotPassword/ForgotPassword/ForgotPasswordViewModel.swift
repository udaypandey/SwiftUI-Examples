//
//  ForgotPasswordViewModel.swift
//  ForgotPassword
//
//  Created by Uday Pandey on 03/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import Combine

class ForgotPasswordViewModel: ObservableObject {
    // Input
    @Published var userName = ""

    // Output
    var sendResetPasswordRequest = false

    private var cancellables: Set<AnyCancellable> = Set([])

    init() {
        // Primitive email validation, check for the presence of @
        $userName
            .removeDuplicates()
            .map { $0.count > 3 && $0.contains("@") ? true: false }
            .assign(to: \.sendResetPasswordRequest, on: self)
            .store(in: &cancellables)
    }
}

