//
//  LoginViewModel.swift
//  SimpleLogin
//
//  Created by Uday Pandey on 02/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    @Published var passwordAgain = ""

    @Published private(set) var isValid = false
    @Published private(set) var loginNameStatus: LoginNameValidationStatus = .empty
    @Published private(set) var passwordStatus: PasswordValidationStatus = .empty

    private var cancellables: Set<AnyCancellable> = Set([])

    init() {
        $userName
            .map { userName -> LoginNameValidationStatus in
                let len = userName.count
                switch len {
                case 0:
                    return .empty
                case 1..<4:
                    return .tooShort
                default:
                    return .valid
                }
            }
            .assign(to: \.loginNameStatus, on: self)
            .store(in: &cancellables)

        Publishers.CombineLatest($password, $passwordAgain)
            .map { password, passwordAgain -> PasswordValidationStatus in
                if password.isEmpty && passwordAgain.isEmpty {
                    return .empty
                } else if password.count < 4 || passwordAgain.count < 4 {
                    return .tooShort
                } else if password != passwordAgain {
                    return .doNotMatch
                }

                return .valid
            }
            .assign(to: \.passwordStatus, on: self)
            .store(in: &cancellables)

        Publishers.CombineLatest($loginNameStatus, $passwordStatus)
            .map { loginNameStatus, passwordStatus in
                loginNameStatus == .valid && passwordStatus == .valid
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancellables)
    }
}

extension LoginViewModel {
    enum LoginNameValidationStatus: String {
        case empty = ""
        case valid = " "
        case tooShort = "Username too short"
    }

    enum PasswordValidationStatus: String {
        case empty = ""
        case valid = " "
        case tooShort = "Password too short"
        case doNotMatch = "Password do not match"
    }
}
