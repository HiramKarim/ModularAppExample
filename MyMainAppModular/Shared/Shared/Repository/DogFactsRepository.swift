//
//  DogFactsRepository.swift
//  Shared
//
//  Created by Hiram Castro on 12/10/22.
//

import Foundation


public protocol DogFactsRepository {
    typealias DogFactResult = Result<DogFactData, DogFactError>
    func getRandomFact(handler: @escaping (DogFactResult) -> Void)
}
