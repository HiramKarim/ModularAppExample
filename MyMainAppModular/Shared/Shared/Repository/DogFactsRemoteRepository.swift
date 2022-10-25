//
//  DogFactsRemoteRepository.swift
//  Shared
//
//  Created by Hiram Castro on 16/10/22.
//

import Foundation
import CoreNetwork

final internal class DogFactsRemoteRepository: DogFactsRepository {
    
    private let httpClient: HTTPClient
    private let api: DogFactsAPI
    
    internal init(httpClient: HTTPClient, api: DogFactsAPI) {
        self.httpClient = httpClient
        self.api = api
    }
    
    func getRandomFact(handler: @escaping (DogFactResult) -> Void) {
        httpClient.get(api.factsURL) { result in
            switch result {
            case .success(let data):
                
                if let dto = Self.parse(type: DogFactDTO.self, data: data) {
                    handler(.success(dto.toData))
                } else {
                    handler(.failure(.notParsable(data)))
                }
                
            case .failure(let error):
                handler(.failure(.fetchError(error)))
            }
        }
    }
    
    private static func parse<T:Decodable>(type: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
}

fileprivate extension DogFactDTO {
  var toData: DogFactData {
      DogFactData(factMessage: "")
  }
}
