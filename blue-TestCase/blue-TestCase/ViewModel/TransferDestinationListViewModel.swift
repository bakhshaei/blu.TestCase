//
//  TransferDestinationListViewModel.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import Foundation

//MARK: - ViewModel Protocol
@MainActor protocol TransferDestinationListViewModelProtocol: ObservableObject {
    var destinationList : Array<TransferDestinationDataModel> { get set }
    
    func fetchData() async
    
    func setFavorite(_ isFavorite: Bool, for item: TransferDestinationDataModel) async
    
    func clearAndRefreshList() async
}

//MARK: - ViewModel Class
@MainActor class TransferDestinationListViewModel : ObservableObject, TransferDestinationListViewModelProtocol {
    
    //MARK: Properties
    @Published /*fileprivate(set)*/ var destinationList : Array<TransferDestinationDataModel> = []
    
    /// A variable to store current page that is already fetched.
    private var pageCounter = 1
    
    ///
    private var service : TransferDestinationServiceProtocol
    
    
    //MARK: Initialization
    init(service: TransferDestinationServiceProtocol) {
        self.service = service
    }
    
    /// Fetch the next page.
    func fetchData() async {
        //1: fetch
        guard let data = try? await service.loadData(fromPage: pageCounter) else { return }
        
        //2: map objects to DataModel
        let dataModels = data.map({TransferDestinationDataModel(from: $0)})
        
        //3: append to `destinationList`
        destinationList.append(contentsOf: dataModels)
    }
    
    
    
    /// Remove all items from destinationList, reset pageCounter and fetchData.
    func clearAndRefreshList() async {
        destinationList.removeAll()
        pageCounter = 1
        await fetchData()
    }

}

//Used in Preview
class TransferDestinationlistViewModel_Preview: TransferDestinationListViewModel {
    init() {
        super.init(service: TransferDestinationService())
        self.destinationList = Array(repeating: .preview, count: 1)
    }

    override func fetchData() async { /*Do Nothing in Preview*/ }
}
