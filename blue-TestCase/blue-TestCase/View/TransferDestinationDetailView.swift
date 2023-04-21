//
//  TransferDestinationDetailView.swift
//  blue-TestCase
//
//  Created by Amin on 4/21/23.
//

import SwiftUI

struct TransferDestinationDetailView: View {
    @State var dataModel : TransferDestinationDataModel
    
    var body: some View {
        VStack {
            Text(dataModel.full_name ?? "")
            Text(dataModel.card_number ?? "")
            Button {
                dataModel.isFavorite.toggle()
            } label: {
                Image(systemName: dataModel.isFavorite ? "star.fill" : "star")
            }

        }
    }
}

struct TransferDestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransferDestinationDetailView(dataModel: .preview)
    }
}
