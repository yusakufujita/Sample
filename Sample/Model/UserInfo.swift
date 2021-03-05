//
//  UserInfo.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/05.
//

import Foundation

struct User: Codable {
    let id: String
    let imageUrl: String // ①

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "profile_image_url" // ②
    }
}
