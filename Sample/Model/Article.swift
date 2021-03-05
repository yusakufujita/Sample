//
//  Article.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/05.
//

import Foundation

class Article: Codable {
    let title: String
    let looking_for:String
    let image:Image
    let company:Company
}

class Image: Codable {
    let i_320_131:String
}

class Company:Codable {
    let name:String
    let avatar:Avatar
}

class Avatar:Codable {
    let orignal:String
}



