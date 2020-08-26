//
//  StateView.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 23/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import SwiftUI

/*
 @State:
 Single source of truth for a view.
 To modify value in a Struct.
 Shouldn't shared across views.
 Destroy and recreate View when it changes.
 Safe to mutate from any thread.
 Should have default value
 */

// @Binding: acts as a reference to a mutable state even without owning it. It update the view’s state accordingly when reference changes. No default value

struct ButtonColor {
    var color: Color
}

struct StateView: View {

    @State var text: String = ""

    @State private var buttonColor: ButtonColor = ButtonColor(color: .pink)

    var body: some View {
        NavigationView{
            VStack {
                Button(action: {
                    self.buttonColor.color = (self.buttonColor.color == .pink) ? Color.orange : Color.pink
                }) {
                    Text("Change Color")
                }


                TextField("Write something", text: $text)
                self.buttonColor.color
                NewView(textBinding: $text)
            }
            .navigationBarTitle("State")
        }
    }

}

struct NewView: View {

    @Binding var textBinding: String

    var body: some View {
        VStack {
            Text(textBinding)
            TextField("Write something", text: $textBinding)
        }
    }
}


struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
