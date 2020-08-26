//
//  AuthView.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 25/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import SwiftUI

struct AuthView: View {

    @State private var email: String = ""
    @State private var isValidEmail: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject private var emailData: EmailData

    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                VStack(spacing: 24.0) {
                    Text("Add your Email")
                        .font(.headline)

                    HStack {
                        TextField("Email", text: self.$email, onCommit: {
                            self.isValidEmail = self.validateEmail()
                        })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)

                        Button(action: {
                            self.emailData.emails.append(self.email)
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image.init(systemName: "arrow.right.circle.fill")
                                .foregroundColor(self.isValidEmail ? Color.green : Color.gray)
                        }.disabled(!self.isValidEmail)

                    }.frame(width: geometry.size.width * 0.7)
                }
            }
            .navigationBarTitle("Add Email", displayMode: .inline)
        }
    }

    private func validateEmail() -> Bool {
        let kEmailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,50}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", kEmailRegex)
        return emailTest.evaluate(with: email.trimmingCharacters(in: .whitespaces))
    }

}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
