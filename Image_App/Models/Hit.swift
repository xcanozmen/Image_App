//
//  Hit.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import RealmSwift

class Hit: Object, Decodable {
    @objc dynamic var  id: Int = 1
    @objc dynamic var  webformatURL: String = ""
    @objc dynamic var  largeImageURL: String = ""
    @objc dynamic var  imageWidth: Int = 0
    @objc dynamic var  imageHeight: Int = 0
    @objc dynamic var  imageSize: Int = 0
    @objc dynamic var  date: Date?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case webformatURL
        case largeImageURL
        case imageWidth
        case imageHeight
        case imageSize
        case date
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
