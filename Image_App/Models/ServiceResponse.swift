//
//  ServiceResponse.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import RealmSwift

class ServiceResponse: Object, Decodable {
    var hits = List<Hit>()
    
    private enum CodingKeys: String, CodingKey {
        case hits
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodeHits = try container.decodeIfPresent([Hit].self, forKey: .hits) ?? [Hit()]
        hits.append(objectsIn: decodeHits)
    }
}
