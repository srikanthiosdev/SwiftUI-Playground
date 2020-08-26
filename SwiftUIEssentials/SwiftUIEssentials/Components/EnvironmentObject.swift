//
//  EnvironmentObject.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 25/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import SwiftUI

// @EnvironmentObject: To create views that depends on shared data.
// Invalidates the current view whenever the observable object changes
// Can access from decendent once set in the ancester widgets, no need to pass in all the views
// Should set using environmentObject(_:) before accessing it

final class DemoEnvironmentObject: ObservableObject {

    @Published var observableObject: String = "AncesterView"

}


struct AncesterView: View {

    @EnvironmentObject var object: DemoEnvironmentObject

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Descendent1()) {
                    Text(object.observableObject)
                }
            }
            .navigationBarTitle("AncesterView")
        }
    }

}

struct Descendent1: View {

    @EnvironmentObject var object: DemoEnvironmentObject

    var body: some View {
        VStack {
            NavigationLink(destination: Descendent2()) {
                Text(object.observableObject)
            }
        }.navigationBarTitle("Descendent1")
    }

}

struct Descendent2: View {

    @EnvironmentObject var object: DemoEnvironmentObject

    var body: some View {
        VStack {
            Text(object.observableObject)
            Button(action: {
                self.object.observableObject = "Updated by Descendent 2"
            }) {
                Text("Tap to update Environment Object")
            }
        }.navigationBarTitle("Descendent2")
    }

}

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        AncesterView().environmentObject(DemoEnvironmentObject())
    }
}
