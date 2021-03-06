//
//  Article.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/05.
//

import Foundation

struct Article: Decodable {
    let data:[Data]    
//    enum CodingKeys: String, CodingKey {
//        case title = "title"
//        case lookingFor = "looking_for"
//        case image
//        case company
//    }
}
struct Data: Decodable {
    let title: String
    let looking_for:String
    let image:Image
    let company:Company
}


struct Image: Decodable {
    let i_320_131:String
//    enum CodingKeys:String,CodingKey {
//        case i3201311 = "i_320_131"
//    }
}

struct Company:Decodable {
    let name:String
    let avatar:Avatar
}

struct Avatar:Decodable {
    let original:String
}



