//
//  PicsumDataBO.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import Foundation
import SwiftyJSON

struct Picsum : Codable {

    var id : Int?
    var author : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case author = "author"
    }
    
    init(json: JSON){
        self.id = json["id"].intValue
        self.author = json["author"].stringValue
    }
}
