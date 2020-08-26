//
//  EmailData.swift
//  SwiftUIEssentials
//
//  Created by Srikanth on 27/07/20.
//  Copyright © 2020 Srikanth. All rights reserved.
//

import Foundation
import SwiftUI

final class EmailData: ObservableObject {

    @Published var emails: [String] = []
    
}
