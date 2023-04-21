//
//  TransferDestinationListViewModelTests.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/20/23.
//

import XCTest
@testable import blue_TestCase

@MainActor
final class TransferDestinationListViewModelTests: XCTestCase {
    
    private var service : MockTrasnferDestinationService!
    private var viewModel : TransferDestinationListViewModel!
    
    override func setUp() {
        super.setUp()
        service = MockTrasnferDestinationService()
        viewModel = TransferDestinationListViewModel(service: service)
    }
    
    override func tearDown() {
        service = nil
        viewModel = nil
        super.tearDown()
    }
    
    //MARK: - Tests for `fetchData()`
    func test_ServiceLoadWithGivenFiveTDs_WhenFetched_ListUpdatedWithFiveTDs() async {
        let destinations : [TransferDestination] = Array(repeating: .default, count: 5)
        service.result = destinations
        
        await viewModel.fetchData()
        XCTAssertEqual(viewModel.destinationList.count, 5)
        
    }
    
    func test_ServiceLoadWithNoTD_WhenFetched_ListDidNotChangeValues() async {
        let temp = viewModel.destinationList
        service.result = nil
        service.error = nil
        
        await viewModel.fetchData()
        XCTAssertEqual(temp, viewModel.destinationList)
    }
    
    func test_ServiceLoadWithError_WhenFetched_ListDidNotChangeValues() async {
        let temp = viewModel.destinationList
        service.error = URLError(.badURL)
        
        await viewModel.fetchData()
        XCTAssertEqual(temp, viewModel.destinationList)
    }
}
