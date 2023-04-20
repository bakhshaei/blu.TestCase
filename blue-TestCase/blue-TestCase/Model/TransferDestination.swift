//
//  TransferDestination.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import Foundation


//MARK: - Models

struct TransferDestination : Decodable {
    //var id              = UUID()
    var person          : Person
    var card            : Card
    var last_transfer   : String?
    var note            : String?
    //var more_info: //TODO: implement if needed!
}

struct Person : Decodable {
    var full_name   : String?
    var email       : String?
    var avatar      : String?
}

struct Card: Decodable {
    var card_number : String?
    var card_type   : String?
}



//MARK: - DataModel
struct TransferDestinationDataModel : Identifiable, Hashable, Equatable {
    var id          = UUID()
    var full_name   : String?
    var avatar_url  : String?
    var card_number : String?
    
    var isFavorite  : Bool = false
    
    init(from model: TransferDestination) {
        full_name   = model.person.full_name
        avatar_url  = model.person.avatar
        card_number = model.card.card_number
    }
    
}
