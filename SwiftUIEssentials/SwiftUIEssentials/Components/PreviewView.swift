//
//  PreviewView.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 24/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import SwiftUI

struct PreviewView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
//        PreviewView()

        // Fixed Layout
//        PreviewView().previewLayout(.fixed(width: 30, height: 50))

        // Preview in Device
//        PreviewView().previewLayout(.device)

        // Grouping multiple Layouts at a time
//        Group {
//            PreviewView().previewLayout(.device)
//            PreviewView()
//        }.previewLayout(.fixed(width: 50, height: 50))

        // Preview multiple device at a time
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            PreviewView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }

        // Preview in dark mode: More options in environment explore it
//        PreviewView().environment(\.colorScheme, .dark)
    }
}


/* Live Preview, Return Single View
 Button(action: {
     print("Tapped Button")
 }) {
     Text("Hello, World!")
 }
 */
