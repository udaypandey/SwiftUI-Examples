//
//  ForgotPasswordView.swift
//  ForgotPassword
//
//  Created by Uday Pandey on 03/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var model: ForgotPasswordViewModel
    @Binding var popToParent: Bool

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.subheadline)

                TextField("john@appleseed.com", text: $model.userName)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom)

            Button(action: {
                // Web request and then pop back to parent
                // on successful response, maybe with a delay,
                // after showing a success message.
                self.popToParent.toggle()
            }) {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
                .padding()
                .border(Color.black)

            }
            .disabled(!model.sendResetPasswordRequest)

        }
        .padding()
        .navigationBarTitle("Forgot Password", displayMode: .inline)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForgotPasswordView(model: ForgotPasswordViewModel(), popToParent: .constant(true))
        }
    }
}
