//
//  LoginView.swift
//  SimpleLogin
//
//  Created by Uday Pandey on 02/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var model: LoginViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("3 to 10 characters"),
                        footer: Text(model.loginNameStatus.rawValue).foregroundColor(.red)) {
                    TextField("john@appleseed.com", text: $model.userName)
                        .autocapitalization(.none)
                }

                Section(header: Text("Use atleast 1 lowercase, 1 uppercase, 1 numeric and 2 special characters"),
                        footer: Text(model.passwordStatus.rawValue).foregroundColor(.red)) {
                    SecureField("Password", text: $model.password)
                    SecureField("Repeat password", text: $model.passwordAgain)
                }

                Section {
                    Button(action: {
                    }) {
                        Text("Login")
                    }.disabled(!model.isValid)
                }
            }
            .navigationBarTitle(Text("Login"))
            .background(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: LoginViewModel())
    }
}

