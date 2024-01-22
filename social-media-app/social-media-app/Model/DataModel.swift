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
    
    enum apiModelError: Error {
        case invalidURL
        case missingData
    }

    
    init (ws: String, proc: String) {
        self.url = "https://socialmediawebservices.azurewebsites.net/RestController.php?ws=" + ws + "&proc=" + proc;
        self.ws = ws;
        self.proc = proc;
    }
    
    
    func getThoughts() async throws -> [ThoughtModel] {
        guard let url = URL(string: self.url) else {
            throw apiModelError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([ThoughtModel].self, from: data)
        
        return result
    }
}


