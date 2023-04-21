//
//  TransferDestinationListView.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import SwiftUI

struct TransferDestinationListView<ViewModel: TransferDestinationListViewModelProtocol>: View {
    
    @StateObject var viewModel : ViewModel //TransferDestinationListViewModelProtocol
    
    var body: some View {
        NavigationStack {
            List(viewModel.destinationList) { item in
                NavigationLink(value: item) {
                    TransferDestinationRowView(dataModel: item)
                }
                .navigationTitle("All")
                .navigationDestination(for: TransferDestinationDataModel.self) { selectedItem in
                    TransferDestinationDetailView(dataModel: selectedItem)
                }
            }
        }
    }
}

struct TransferDestinationListView_Previews: PreviewProvider {
    static var previews: some View {
        TransferDestinationListView(viewModel: TransferDestinationlistViewModel_Preview())
    }
}
