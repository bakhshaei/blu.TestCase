//
//  ContentView.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import SwiftUI

struct ContentView<FavViewModel: FavoriteDestinationViewModelProtocol>: View {
    
    @StateObject var favViewModel : FavViewModel
    @AppStorage("favoritedItems") private var storedFavorites: Data?
    
    var body: some View {
        NavigationStack {
            FavoriteDestinationListView<FavViewModel>()
                .background(Color("contentBackground"))
            
            if favViewModel.favoritedList.count > 0 {
                HStack {
                    Text("All")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                .background(Color("contentBackground"))
            }
            TransferDestinationListView<TransferDestinationListViewModel>(
                viewModel: TransferDestinationListViewModel(
                    service: MockTransferDestinationService() //TransferDestinationService()
                )
            )
            .navigationTitle(favViewModel.favoritedList.count > 0 ? "Favorites" : "All")
        }
        .environmentObject(favViewModel)
        .task {
            if let jsonData = storedFavorites {
                favViewModel.jsonData = jsonData
            }
            for await _ in favViewModel.objectWillChangeSequence {
                storedFavorites = favViewModel.jsonData
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let favModel = FavoriteDestinationViewModel(favoritedList: [.preview])
        ContentView(favViewModel: favModel)
    }
}
