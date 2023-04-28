//
//  TransferDestinationDetailView.swift
//  blue-TestCase
//
//  Created by Amin on 4/21/23.
//

import SwiftUI

struct TransferDestinationDetailView<FavViewModel: FavoriteDestinationViewModelProtocol>: View {
    
    @Binding var dataModel : TransferDestinationDataModel
    @EnvironmentObject var favViewModel : FavViewModel
    
    var body: some View {
        VStack {
            Text(dataModel.full_name ?? "")
            Text(dataModel.card_number ?? "")
            Button {
                dataModel.isFavorite.toggle()
                favViewModel.updateState(for: dataModel)
            } label: {
                Image(systemName: dataModel.isFavorite ? "star.fill" : "star")
            }

        }
    }
}

struct TransferDestinationDetailView_Previews: PreviewProvider {
    @State static var model = TransferDestinationDataModel.preview
    static var previews: some View {
        TransferDestinationDetailView<FavoriteDestinationViewModel>(dataModel: $model)
    }
}
