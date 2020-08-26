//
//  EmailList.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 27/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import SwiftUI

struct EmailList: View {

    @EnvironmentObject private var emailData: EmailData
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List(emailData.emails, id: \.self) { (email) in
                Text(email)
            }
            .navigationBarTitle("Email List", displayMode: .automatic)
            .navigationBarItems(trailing: Button(action: {
                self.isPresented = true
            }, label: {
                Text("Add")
            }))
                .sheet(isPresented: $isPresented) {
                    AuthView().environmentObject(self.emailData)
            }
        }
    }

}

struct EmailList_Previews: PreviewProvider {
    static var previews: some View {
        EmailList().environmentObject(EmailData())
    }
}
