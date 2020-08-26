
import SwiftUI
import PlaygroundSupport

// Agenda

/*
1. What's SwiftUI?
2. Why/n't SwiftUI?
3. Brief: Xcode tools for SwiftUI
4. Components to make SwiftUI
5. Sample App
*/

// 1. What's SwiftUI:
/*
- Framework to develop UI in a declarative way for all apple platforms
- Declare UI: We will tell how the ui should look and work, with all the possible states.
- Applicable to all Apple's Platform. It's not write once run anywhere concept, we need changes behaviour of our app on every platform.
 */

// 2. Why/n't SwiftUI:
/*
 Whyn't:
 - Supports iOS 13 and above
 - Rely on UIKit for some features. Need to improvise

 Why:
 - Support all platforms, automatic support for Dynamic Type, Dark Mode, localization, and accessibility.
 - No storyboard conflicts
 - Code is the only source of truth: AutoSync between code and Canvas
 - Preview immediately, fast development
 - Less Errors, Unidirectional data flow */

// 3. Xcode tools for SwiftUI
/*
 - Canvas automatically recognizes and displays any type in the current editor that conforms to the PreviewProvider protocol.
 - Live Preview for interactivity and to view UIKit views[UIViewRepresentable]
 - AutoSync between code and Canvas
 - SwiftUI Inspector to customise views
 - Added SwiftUI Views in object library
 - Modifiers: cutomise rendering and interactivity. It will return new view and we can chain it.
 */

// 4. Components of SwiftUI:
/*
 - Opaque return types: Won't reveal concrete types for encapsulation
 - Property wrappers
 - @EnvironmentObject
 - @State
 - @Environment
 - @Binding
 - @Published
 */

// 5. Sample App:
/*
 - List: Identifiable, Hashable conformance
 - Understand the app through components we learnt
 */


//----------------------------------------------------------------------------------------------------------------------------------------


// Opaque return types
/*
 Won't reveal concrete implementation better encapsulation
 */

struct OpaqueView: View {

    var body: some View {
        HStack {
            Text("Opaque Hello, World!")
        }
    }
}

protocol Photo {
    associatedtype Content
    var content: Content { get }
    init(content: Content)
}

struct URLPhoto: Photo {
    var content: URL
}

func getPhoto() -> some Photo {
    return URLPhoto(content: URL(string: "")!)
}


// Property Wrapper
/*
 It attach general behaviours and logics inside of it. Theryby helps code reusability
 */

@propertyWrapper
struct Email<Value: StringProtocol> {

    private var value: Value?

    init(wrappedValue value: Value?) {
        self.value = value
    }

    var wrappedValue: Value? {
        get {
            return validate(email: value) ? value : nil
        }
        set {
            value = newValue
        }
    }

    private func validate(email: Value?) -> Bool {
        guard let email = email else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

class TestPropertyWrapper {

    @Email
    var email: String?

    func testPropertyWrapper() {
        email = "valid@test.com"
        print(email) // test@test.com

        email = "invalid"
        print(email) // nil

    }

}

let testWrapper = TestPropertyWrapper()
testWrapper.testPropertyWrapper()
