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
        
    }
    
}
