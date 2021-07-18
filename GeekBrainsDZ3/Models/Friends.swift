//
//  Friends.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import RealmSwift
import DynamicJSON


//struct Friends: Codable {
// var response: Response?
//
//}
//struct Response:Codable {
//     let items: [Item]?
//}
//
//
//class Item: Object, Codable {
//    @objc dynamic var firstName: String
//    @objc dynamic var id       : Int
//    @objc dynamic var lastName : String
//    let photo100 : String
//
//
//    enum CodingKeys: String, CodingKey {
//        case firstName = "first_name"
//        case id       = "id"
//        case lastName  = "last_name"
//        case photo100  = "photo_100"
//    }
//
//}
//


class Friends: Object, Response{
    @objc dynamic var id: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var photoString: String = ""
    @objc dynamic var trackCode: String = ""
    
    override init() {
      
    }
    
    required init?(json: JSON){
        guard let id = json.id.string,
              let lastName = json.last_name.string,
              let firstName = json.first_name.string,
              let photo100 = json.photo_100.string,
              let trackCode = json.track_code.string else {
            print("UserModel not init from JSON")
            return nil
        }
        self.id = id
        self.lastName = lastName
        self.firstName = firstName
        self.photoString = photo100
        self.trackCode = trackCode
        
    }
    
}

protocol Response {
    init?(json: JSON)
}
// - - - - - - -
protocol Request{
    var params: [String: Any] { get }
}
// - - - - - - - - - - 
struct DefaultURL{
    static let baseURL = "https://api.vk.com/method"

}

// - - - - -  - -

struct FriendsRequest: Request {
    var params: [String : Any] {
        return ["user_id": userId,
                "order":order,
                "fields":fields,
                "v":version,
                "count":count,
                "access_token": token]
    }
    
    private let order = "name"
    private let fields = "photo_100"
    private let version = "5.21"
    let userId: String
    let count: Int
    let token: String
    
}

