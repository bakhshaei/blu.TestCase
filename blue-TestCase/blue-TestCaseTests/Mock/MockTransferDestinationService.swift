//
//  MockTransferDestinationService.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/21/23.
//

import Foundation
@testable import blue_TestCase

class MockTrasnferDestinationService : TransferDestinationServiceProtocol {
    
    var result : [TransferDestination]?
    var error : Error?
    
    func loadData(fromPage page: Int) async throws -> [blue_TestCase.TransferDestination]? {
        if let error {
            throw error
        }
        
        return result
    }
    
    
}
