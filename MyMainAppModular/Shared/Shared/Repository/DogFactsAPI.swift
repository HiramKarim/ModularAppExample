//
//  DogFactsAPI.swift
//  Shared
//
//  Created by Hiram Castro on 12/10/22.
//

import Foundation

struct DogFactsAPI {
    
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
}

extension DogFactsAPI {
    var factsURL: URL {
        getURL(path: "")
    }
}

fileprivate extension DogFactsAPI {
    func getURL(path: String) -> URL {
        return URL(string: "\(environment.baseURL)/\(path)")!
    }
}
