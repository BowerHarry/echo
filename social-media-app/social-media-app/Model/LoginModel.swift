//
//  LoginModel.swift
//  social-media-app
//
//  Created by Harry Bower on 23/01/2024.
//

import UIKit


struct LoginRequest: Codable { // or Decodable
    let username: String
    let encodedPassword: String
}

struct LoginResponse: Codable { // or Decodable
    let userId: Int
    let sessionToken: Int
    
    private enum CodingKeys : String, CodingKey {
        case userId = "UserID"
        case sessionToken = "SessionToken"
    }
}

