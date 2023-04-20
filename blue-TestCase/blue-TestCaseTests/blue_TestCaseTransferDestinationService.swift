//
//  blue_TestCaseTransferDestinationService.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/20/23.
//

import XCTest
@testable import blue_TestCase

final class blue_TestCaseTransferDestinationService: XCTestCase {
    
    private var service : TransferDestinationServiceProtocol = TransferDestinationService()
    
    
    func test_FetchListSuccessfully() async {
        service = TransferDestinationService()
        
        do {
            if let datas = try await service.loadData(fromPage: nil) {
                XCTAssertGreaterThan(datas.count, 0)
            }
            
        }
        catch {
            XCTAssertThrowsError(error)
        }
    }
    func test_FetchListForSpecificPageNumberSuccessfully() async {
        service = TransferDestinationService()
        
        do {
            if let datas = try await service.loadData(fromPage: 2) {
                XCTAssertGreaterThan(datas.count, 0)
            }
            
        }
        catch {
            XCTAssertThrowsError(error)
        }
    }
    
    func test_FetchListFailWithInvalidURL() async {
        
        //TODO: Write tests for failed scenarios
    }
    
}
