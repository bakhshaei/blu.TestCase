//
//  Card+Default.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/21/23.
//

import Foundation
@testable import blue_TestCase

extension Card {
    static var `default` : Card {
        return .init(card_number: "1234567890",
                     card_type: "myCardType")
    }
}
