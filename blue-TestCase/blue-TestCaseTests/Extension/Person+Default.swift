//
//  Person+Default.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/21/23.
//

import Foundation
@testable import blue_TestCase

extension Person {
    static var `default` : Person {
        return .init(full_name: "myName myFamily",
                     email: "myName@company.com",
                     avatar: "https://www.dropbox.com/s/64y9lcnca22p1jx/avatar1.png?dl=1")
    }
}
