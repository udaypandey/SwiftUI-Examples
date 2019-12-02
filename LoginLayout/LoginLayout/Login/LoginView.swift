//
//  LoginView.swift
//  LoginLayout
//
//  Created by Uday Pandey on 02/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI
struct LoginView: View {
    @ObservedObject var model: LoginViewModel

    var body: some View {
        VStack {
            LogoView()
                .frame(width: 120, height: 120)
                .padding()

            VStack(alignment: .leading) {
                Text("Username / email")
                    .font(.subheadline)

                TextField("john@appleseed.com", text: $model.userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Password")
                    .font(.subheadline)

                SecureField("3-10 characters", text: $model.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Button(action: {
            }) {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
                .padding()
                .background(Color.green)
                .cornerRadius(10)
            }
            .disabled(!model.canLogin)
            .padding([.top, .bottom])

            Button(action: {
            }) {
                HStack {
                    Spacer()
                    Text("Forgot Password?")
                }
                .padding([.top, .bottom])
            }
        }
        .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: LoginViewModel())
    }
}
