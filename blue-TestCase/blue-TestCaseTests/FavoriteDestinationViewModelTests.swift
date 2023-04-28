//
//  FavoriteDestinationViewModelTests.swift
//  blue-TestCaseTests
//
//  Created by Amin on 4/28/23.
//

import XCTest
@testable import blue_TestCase

final class FavoriteDestinationViewModelTests: XCTestCase {
    var viewModel : FavoriteDestinationViewModel!
    
    //MARK: - setUp and tearDown
    override func setUp() {
        viewModel = FavoriteDestinationViewModel(favoritedList: [])
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    //MARK: - Tests for `updateState(for:)`
    func test_AddThreeItemsInFavorite_FavListSuccessfullyUpdated() {
        
        let rawList = Array(repeating: TransferDestination.default, count: 3)
            .map({TransferDestinationDataModel(from: $0)})
        
        for i in 0..<rawList.count {
            var temp = rawList[i]
            temp.full_name = (temp.full_name ?? "") + "_\(i)"
            temp.isFavorite = true
            viewModel.updateState(for: temp)
        }
        
        XCTAssertTrue(viewModel.favoritedList.contains(where: {$0.id == rawList[0].id}))
        XCTAssertTrue(viewModel.favoritedList.contains(where: {$0.id == rawList[1].id}))
        XCTAssertTrue(viewModel.favoritedList.contains(where: {$0.id == rawList[2].id}))
        
    }
    
    //MARK: - Tests for `objectWillChangeSequence`
    
    
    //MARK: - Tests for `jsonData`
    
}
