# SwiftUI
A brief introduction about SwiftUI framework

## Agenda

1. What's SwiftUI?
2. Why/n't SwiftUI?
3. Brief: Xcode tools for SwiftUI
4. Components to make SwiftUI
5. Sample App

## What's SwiftUI:
- Framework to develop UI in a declarative way for all apple platforms
- Declare UI: We will tell how the ui should look and work, with all the possible states.
- Applicable to all Apple's Platform. It's not write once run anywhere concept, we need changes behaviour of our app for each platform.


## Why/n't SwiftUI:
 ### Whyn't:
 - Supports iOS 13 and above
 - Rely on UIKit for some features. Need to improvise

 ### Why:
 - Support all platforms, automatic support for Dynamic Type, Dark Mode, localization, and accessibility.
 - No storyboard conflicts
 - Code is the only source of truth: AutoSync between code and Canvas
 - Preview immediately, fast development
 - Less Errors, Unidirectional data flow

## Xcode tools for SwiftUI

 - Canvas automatically recognizes and displays any type in the current editor that conforms to the PreviewProvider protocol.
 - Live Preview for interactivity and to view UIKit views[UIViewRepresentable]
 - AutoSync between code and Canvas
 - SwiftUI Inspector to customise views
 - Added SwiftUI Views in object library
 - Modifiers: cutomise rendering and interactivity. It will return new view and we can chain it.

## Components of SwiftUI:

 - Opaque return types: Won't reveal concrete types for encapsulation
 - Property wrappers
 - @EnvironmentObject
 - @State
 - @Environment
 - @Binding
 - @Published

## Sample App:

 - List: Identifiable, Hashable conformance
 - Understand the app through components we learnt
 
