//
//  TransferDestinationListViewModel.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import Foundation

//MARK: - ViewModel Protocol
@MainActor protocol TransferDestinationListViewModelProtocol: ObservableObject {
    var destinationList : Array<TransferDestinationDataModel> { get }
    
    func fetchData() async
}

//MARK: - ViewModel Class
@MainActor class TransferDestinationListViewModel : ObservableObject, TransferDestinationListViewModelProtocol {
    
    //MARK: Properties
    @Published private(set) var destinationList : Array<TransferDestinationDataModel> = []
    
    private var service : TransferDestinationServiceProtocol
    
    
    //MARK: Initialization
    init(service: TransferDestinationServiceProtocol) {
        self.service = service
    }
    
    /// Fetch the next page.
    func fetchData() async {
        //1: fetch
        guard let data = try? await service.loadData(fromPage: nil) else { return }
        
        //2: map objects to DataModel
        let dataModels = data.map({TransferDestinationDataModel(from: $0)})
        
        //3: append to `destinationList`
        destinationList.append(contentsOf: dataModels)
    }
}
