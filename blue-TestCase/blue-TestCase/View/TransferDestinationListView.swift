//
//  TransferDestinationListView.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import SwiftUI

struct TransferDestinationListView<ViewModel: TransferDestinationListViewModelProtocol>: View {
    
    @StateObject var viewModel : ViewModel
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach($viewModel.destinationList) { item in
                    NavigationLink {
                        TransferDestinationDetailView(dataModel: item)
                    } label: {
                        TransferDestinationRowView(dataModel: item)
                    }
                }
                ProgressView()
                    .task {
                        await viewModel.fetchData()
                    }
            }
            .navigationTitle("All")
            .refreshable {
                await viewModel.clearAndRefreshList()
            }
        }
        .environmentObject(viewModel)
        
    }
}

struct TransferDestinationListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TransferDestinationlistViewModel_Preview()
        TransferDestinationListView(viewModel: viewModel)
            .environmentObject(viewModel)
    }
}
