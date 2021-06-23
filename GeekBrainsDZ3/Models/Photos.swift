//
//  Photos.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation



// MARK: - Photos
struct Photos: Codable {
    let response: ResponsePhotos?
}

// MARK: - Response
struct ResponsePhotos: Codable {
    let count: Int?
    let itemsPhotos: [ItemPhotos]?
}

// MARK: - Item
struct ItemPhotos: Codable {
    let albumID, date, id, ownerID: Int?
    let hasTags: Bool?
    let photo130, photo604, photo75: String?
    let text: String?
    let userID, height: Int?
    let photo807: String?
    let width, postID: Int?
    let photo1280, photo2560: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case photo130 = "photo_130"
        case photo604 = "photo_604"
        case photo75 = "photo_75"
        case text = "text"
        case userID = "user_id"
        case height
        case photo807 = "photo_807"
        case width
        case postID = "post_id"
        case photo1280 = "photo_1280"
        case photo2560 = "photo_2560"
    }
}
