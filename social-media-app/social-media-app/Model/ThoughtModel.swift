//
//  ThoughtModel.swift
//  social-media-app
//
//  Created by Harry Bower on 20/01/2024.
//

import UIKit

class DateTimeModel: Codable {
    let date: String
    let timezone_type: Int
    let timezone: String
}

struct ThoughtModel: Codable { // or Decodable
    //let id: Int
    //let userId: Int
    let fullName: String
    let userName: String
    let text: String
    let createdDate: DateTimeModel
    
    private enum CodingKeys : String, CodingKey {
        //case id = "ID"
        //case userId = "eUserID"
        case fullName = "FullName"
        case userName = "Username"
        case text = "Text"
        case createdDate = "CreatedDateTime"
    }
}




