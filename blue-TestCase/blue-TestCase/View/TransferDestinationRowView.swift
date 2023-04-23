//
//  TransferDestinationRowView.swift
//  blue-TestCase
//
//  Created by Amin on 4/21/23.
//

import SwiftUI

struct TransferDestinationRowView: View {
    
    @Binding var dataModel : TransferDestinationDataModel
    
    //TODO: Implement LazyLoading for avatar
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 40)
                .padding(.horizontal, 3)
                .foregroundColor(.secondary.opacity(0.5))
            
            VStack(alignment: .leading) {
                Text(dataModel.full_name ?? "")
                    .font(.headline)
                Text("Identifier")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: dataModel.isFavorite ? "star.fill" : "star")
                .foregroundColor(.yellow)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            Button{
                dataModel.isFavorite.toggle()
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
        TransferDestinationRowView(dataModel: $model)
    }
}
