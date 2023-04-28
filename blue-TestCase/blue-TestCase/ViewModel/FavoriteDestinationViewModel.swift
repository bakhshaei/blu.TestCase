//
//  FavoriteDestinationViewModel.swift
//  blue-TestCase
//
//  Created by Amin on 4/28/23.
//

import Foundation
import Combine
import SwiftUI


//MARK: - FavoriteDestination viewModel Protoocl
protocol FavoriteDestinationViewModelProtocol: ObservableObject {
    var favoritedList : Array<TransferDestinationDataModel> { get set }
    
    var jsonData: Data? { get set }
    
    var objectWillChangeSequence: AsyncPublisher<Publishers.Buffer<ObservableObjectPublisher>> { get }
    
    func updateState(for item: TransferDestinationDataModel)
}

//MARK: - FavoriteDestination viewModel Class
class FavoriteDestinationViewModel: FavoriteDestinationViewModelProtocol, ObservableObject, Codable {
    //MARK:  Properties
    @Published var favoritedList : Array<TransferDestinationDataModel> = []
    
    var jsonData: Data? {
        get { try? encoder.encode(favoritedList) }
        set {
            guard let data = newValue,
                  let model = try? decoder.decode([TransferDestinationDataModel].self, from: data)
            else { return }
            favoritedList = model
        }
    }
    
    var objectWillChangeSequence: AsyncPublisher<Publishers.Buffer<ObservableObjectPublisher>> {
        objectWillChange
            .buffer(size: 3, prefetch: .byRequest, whenFull: .dropOldest)
            .values
    }
    
    private lazy var decoder = JSONDecoder()
    private lazy var encoder = JSONEncoder()

    enum CodingKeys: String, CodingKey {
        case favoritedList
    }
    
    //MARK: Initializations
    internal init(favoritedList: Array<TransferDestinationDataModel> = []) {
        self.favoritedList = favoritedList
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let items = try container.decodeIfPresent(
            [TransferDestinationDataModel].self, forKey: .favoritedList) {
            self.favoritedList = items
        }
    }
    
    //MARK: Methods
    func updateState(for item: TransferDestinationDataModel) {
        
        if item.isFavorite {
            if !favoritedList.contains(where: {$0 ~= item }) {
                favoritedList.append(item)
            }
        } else {
            favoritedList.removeAll(where: {$0 ~= item})
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(favoritedList, forKey: .favoritedList)
    }

}
