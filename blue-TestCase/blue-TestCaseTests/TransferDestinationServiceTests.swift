//
//  blue_TestCaseTransferDestinationService.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/20/23.
//

import XCTest
@testable import blue_TestCase

class TransferDestinationServiceTests: XCTestCase {
    
    private var service : TransferDestinationService!
    
    //MARK: - setUp and tearDown
    override func setUp() {
        super.setUp()
        service = TransferDestinationService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    //MARK: - Tests for `loadData(fromPage:)`
    func test_FetchListSuccessfully() async {
        service = TransferDestinationService()
        
        do {
            if let datas = try await service.loadData(fromPage: nil) {
                XCTAssertGreaterThan(datas.count, 0)
            }
            
        }
        catch {
            XCTAssertFalse(true, error.localizedDescription)
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
            XCTAssertFalse(true, error.localizedDescription)
        }
    }
    
    func test_FetchListFailWithInvalidURL() async {
        
        //TODO: Write tests for failed scenarios
    }
    
}
