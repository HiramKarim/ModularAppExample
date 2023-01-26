//
//  DogFactsAPI.swift
//  Shared
//
//  Created by Hiram Castro on 12/10/22.
//

import Foundation

public struct DogFactsAPI {
    
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
}

struct DogFactsEnvironment: Environment {
    let baseURL: String = "https://dog-api.kinduff.com/api"
}

extension DogFactsAPI {
    var factsURL: URL {
        getURL(path: "facts")
    }
}

extension DogFactsAPI {
  public static var dev: Self {
    DogFactsAPI(environment: DogFactsEnvironment())
  }
}

fileprivate extension DogFactsAPI {
    func getURL(path: String) -> URL {
        return URL(string: "\(environment.baseURL)/\(path)?number=1")!
    }
}
