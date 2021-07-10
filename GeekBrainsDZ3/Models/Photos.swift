//
//  Photos.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import RealmSwift


// MARK: - Photos
struct Photos: Codable {
    let response: ResponsePhotos?
}

// MARK: - Response
struct ResponsePhotos: Codable {
    let count: Int?
    let items: [ItemPhotos]?
}

// MARK: - Item
class ItemPhotos: Object, Codable {
    @objc dynamic var photo1280, photo130, photo604, photo75: String?
    let photo807: String?

    enum CodingKeys: String, CodingKey {
        case photo1280 = "photo_1280"
        case photo130 = "photo_130"
        case photo604 = "photo_604"
        case photo75 = "photo_75"
        case photo807 = "photo_807"
    }
}


// MARK: - Lik
//// MARK: - Photos
//struct Photos:Codable {
//    let response: ResponsePhotos?
//}
//
//// MARK: - Response
//struct ResponsePhotos:Codable {
//    let itemsPhotos: [ItemPhotos]?
//}
//
//// MARK: - Item
//struct ItemPhotos: Codable {
//    let photo130: String
//
//    enum CodingKeys: String, CodingKey {
//        case photo130 = "photo_130"
//
//    }
//}
