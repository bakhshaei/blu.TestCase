//
//  TransferDestination+Default.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/21/23.
//

import Foundation
@testable import blue_TestCase

extension TransferDestination {
    static var `default` : TransferDestination {
        return .init(person: .default,
                     card: .default,
                     last_transfer: "2022-10-02T19:26:00Z",
                     note: "Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.")
    }
}



