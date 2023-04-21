//
//  TransferDestinationRowView.swift
//  blue-TestCase
//
//  Created by Amin on 4/21/23.
//

import SwiftUI

struct TransferDestinationRowView: View {
    @State var dataModel : TransferDestinationDataModel
    
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
    }
}

struct TransferDestinationRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransferDestinationRowView(dataModel: .preview)
    }
}
