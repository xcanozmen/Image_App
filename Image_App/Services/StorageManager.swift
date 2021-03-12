//
//  StorageManager.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static let shared = StorageManager()
    
    func saveImages(_ hits: List<Hit>) {
        try! realm.write {
            realm.add(hits, update: .modified)
        }
    }
    
    func saveDowloadingDate(_ hit: Hit) {
        try! realm.write {
            hit.date = Date()
        }
    }

}
