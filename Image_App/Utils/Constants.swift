//
//  Constants.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

import Foundation
import UIKit
import RealmSwift

let URL_BASE = "https://pixabay.com/api/"
let API_KEY = "13444563-94c316606a96f9ea0c34b1829"

typealias ServiceResponseCompletion = (List<Hit>?) -> ()

struct XibNames {
    static let HomeImageCell = "HomeImageCell"
    static let DetailImageCell = "DetailImageCell"
}

struct Identifiers {
    static let HomeImageCell = "HomeImageCell"
    static let DetailImageCell = "DetailImageCell"
}

struct Segues {
    static let ToDetailImageVC = "ToDetailImageVC"
}

struct AppImages {
    static let Placeholder = "placeholder"
}
