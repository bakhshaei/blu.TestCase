//
//  FavoriteDestinationListView.swift
//  blue-TestCase
//
//  Created by Amin on 4/28/23.
//

import SwiftUI

struct FavoriteDestinationListView<FavViewModel: FavoriteDestinationViewModelProtocol>: View {
    
    @EnvironmentObject var favViewModel : FavViewModel
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach($favViewModel.favoritedList) { item in
                        NavigationLink {
                            TransferDestinationDetailView<FavViewModel>(dataModel: item)
                        } label: {
                            TransferDestinationRowView<FavViewModel>(dataModel: item,
                                                       isHorizontalFavoriteItem: true)
                            .padding(.horizontal, 5)
                        }
                    }
                }
            }
    }
}

struct FavoriteDestinationListView_Previews: PreviewProvider {
    static var previews: some View {
        let favViewModel = FavoriteDestinationViewModel(favoritedList: [.preview, .preview])
        FavoriteDestinationListView<FavoriteDestinationViewModel>()
            .environmentObject(favViewModel)
    }
}
