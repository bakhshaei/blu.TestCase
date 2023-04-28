//
//  TransferDestinationRowView.swift
//  blue-TestCase
//
//  Created by Amin on 4/21/23.
//

import SwiftUI

struct TransferDestinationRowView<FavViewModel: FavoriteDestinationViewModelProtocol>: View {
    
    @Binding var dataModel : TransferDestinationDataModel
    @EnvironmentObject var favViewModel : FavViewModel
    @State var isHorizontalFavoriteItem : Bool = false
    
    
    //TODO: Implement LazyLoading for avatar
    
    var body: some View {
        
        ///An appropriate layout based on `isFavorite` state. Vertical if it's favorited and Horizontal if it isn't favorited.
        let containerLayout = isHorizontalFavoriteItem ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        ///An appropriate layout and alignment based on `isFavorite` state. Using for Texts.
        let textsLayout = isHorizontalFavoriteItem ? AnyLayout(VStackLayout(alignment: .center)) : AnyLayout(VStackLayout(alignment: .leading))
        
        containerLayout {
            Circle()
                .frame(width: 40)
                .padding(.horizontal, 3)
                .foregroundColor(.secondary.opacity(0.5))
            
            textsLayout {
                Text(dataModel.full_name ?? "")
                    .font(.headline)
                Text("Identifier")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            if !isHorizontalFavoriteItem {
                Spacer()
                Image(systemName: dataModel.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            Button{
                dataModel.isFavorite.toggle()
                favViewModel.updateState(for: dataModel)
            } label: {
                Image(systemName: "star")
            }
        }
        .padding(.vertical, 4)
    }
}

struct TransferDestinationRowView_Previews: PreviewProvider {
    @State static var model = TransferDestinationDataModel.preview
    static var previews: some View {
        VStack {
            TransferDestinationRowView<FavoriteDestinationViewModel>(dataModel: $model)
            TransferDestinationRowView<FavoriteDestinationViewModel>(dataModel: $model, isHorizontalFavoriteItem: true)
        }
    }
}
