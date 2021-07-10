//
//  Groups.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import RealmSwift


// MARK: - Groups
struct Groups: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup:Codable {
    let count: Int?
    let items: [ItemGroup]
}

// MARK: - Item
class ItemGroup:Object,  Codable {
    @objc dynamic var id: Int
    @objc dynamic var name, screenName: String?
    @objc dynamic var isClosed: Int
    var type: TypeEnum?
    @objc dynamic var photo50, photo100, photo200: String?
    @objc dynamic var deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case deactivated
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}

