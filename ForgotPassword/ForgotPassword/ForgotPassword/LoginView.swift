//
//  LoginView.swift
//  ForgotPassword
//
//  Created by Uday Pandey on 03/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var popToParent = false
    var body: some View {
        NavigationView {
            NavigationLink(destination: ForgotPasswordView(model: ForgotPasswordViewModel(), popToParent: $popToParent),
                           isActive: $popToParent) {
                Text("Forgot Password?")
                    .navigationBarTitle("Login")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
