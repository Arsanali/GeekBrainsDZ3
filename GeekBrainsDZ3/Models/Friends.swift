//
//  Friends.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import RealmSwift
import DynamicJSON


struct Friends: Codable {
 var response: Response?

}
struct Response:Codable {
     let items: [Item]?
}


class Item: Object, Codable {
    @objc dynamic var firstName: String
    @objc dynamic var id       : Int
    @objc dynamic var lastName : String
    let photo100 : String


    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id       = "id"
        case lastName  = "last_name"
        case photo100  = "photo_100"
    }

}


