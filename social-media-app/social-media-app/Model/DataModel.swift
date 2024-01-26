//
//  DataModel.swift
//  social-media-app
//
//  Created by Harry Bower on 20/01/2024.
//

import UIKit

struct apiModel {
    let url: String
    let ws: String
    let proc: String
    let args: Data?
    
    enum apiModelError: Error {
        case invalidURL
        case missingData
    }

    
    init (ws: String, proc: String, args: Data?) {
        self.url = "https://socialmediawebservices.azurewebsites.net/RestController.php?ws=" + ws + "&proc=" + proc;
        self.ws = ws;
        self.proc = proc;
        self.args = args;
    }
    
    
    func getThoughts() async throws -> [ThoughtModel] {
        guard let url = URL(string: self.url) else {
            throw apiModelError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([ThoughtModel].self, from: data)
        
        return result
    }
    
    func getLoginResult() async throws -> [LoginResponse] {
        guard let url = URL(string: self.url) else {
            throw apiModelError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = self.args
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode([LoginResponse].self, from: data)
        
        return result
    }
}


