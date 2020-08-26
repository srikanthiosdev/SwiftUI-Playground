//
//  EnvironmentView.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 27/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import SwiftUI

// @Environment:
/*
 We can read and subscribe on changes for the selected value.
 Supports Inheritance by applying Environment modifier to child
 SwiftUI uses by creating and passing Sytem wide settings
 */

struct EnvironmentView: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var navigationLink: some View {
        NavigationLink(destination: TrailingView().environment(\.colorScheme, .dark), label: {
            Text("Tap me to change Trailing mode")
        })
    }

    var body: some View {
        NavigationView{
            Group {
                if horizontalSizeClass  == .some(.compact) {
                    VStack {
                        Text("VStack: Compact: First Line Text")
                        Spacer()
                        Text("VStack: Compact: Last Line Text")
                        navigationLink
                        Spacer()
                    }

                } else if horizontalSizeClass  == .some(.regular){
                    HStack {
                        Text("HStack: Regular: First Line Text")
                        Spacer()
                        Text("HStack: Regular: Last Line Text")
                        navigationLink
                        Spacer()
                    }
                } else {
                    VStack {
                        Text("First Line Text")
                        Text("Last Line Text")
                        navigationLink
                    }
                }
            }
            .navigationBarTitle("Environment")
        }
    }

}


struct TrailingView: View {

    var body: some View {
        Text("Hai Guys! Hai Guys!Hai Guys!Hai Guys!Hai Guys!Hai Guys!Hai Guys!Hai Guys!Hai Guys!Hai Guys!Hai Guys!")
        .navigationBarTitle("Trailing mode screen")
    }

}


struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().environment(\.horizontalSizeClass, .compact)
    }
}
