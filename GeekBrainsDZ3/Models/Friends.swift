//
//  Friends.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation

// MARK: - InfoFriends
struct Friends: Codable {
    let response: Response?
}

// MARK: - Response
struct Response: Codable {
    let count: Int?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let firstName: String?
    let id: Int?
    let lastName: String?
    let domain: String?
    let trackCode: String?
    let lists: [Int]?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case domain = "domain"
        case trackCode = "track_code"
        case lists = "lists"
    }
}


