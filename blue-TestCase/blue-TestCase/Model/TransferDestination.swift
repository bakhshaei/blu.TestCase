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
struct TransferDestinationDataModel : Identifiable, Hashable, Equatable, Codable {
    
    var id          : UUID
    var full_name   : String?
    var avatar_url  : String?
    var card_number : String?
    
    var isFavorite  : Bool = false {
        didSet {
            //
        }
    }
    
    //MARK: Initializer
    init(from model: TransferDestination) {
        id          = UUID()
        full_name   = model.person.full_name
        avatar_url  = model.person.avatar
        card_number = model.card.card_number
    }
    
    internal init(id: UUID = UUID(),
                  full_name: String? = nil,
                  avatar_url: String? = nil,
                  card_number: String? = nil,
                  isFavorite: Bool = false) {
        self.id = id
        self.full_name = full_name
        self.avatar_url = avatar_url
        self.card_number = card_number
        self.isFavorite = isFavorite
    }
}

extension TransferDestinationDataModel {
    ///Comparing if two DataModels are similar to each other except their ID. 
    static func ~= (lhs: TransferDestinationDataModel, rhs: TransferDestinationDataModel) -> Bool {
        lhs.full_name   == rhs.full_name &&
        lhs.avatar_url  == rhs.avatar_url &&
        lhs.card_number == rhs.card_number
    }
    
    
}


extension TransferDestinationDataModel {
    ///Defining default value to use in Previews
    static var `preview` : TransferDestinationDataModel {
        return .init(full_name: "myFullname_Preview",
                     avatar_url: "https://www.dropbox.com/s/64y9lcnca22p1jx/avatar1.png?dl=1",
                     card_number: "1234567890")
    }
}
