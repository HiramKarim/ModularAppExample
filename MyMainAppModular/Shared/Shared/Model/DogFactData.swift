//
//  DogFactData.swift
//  Shared
//
//  Created by Hiram Castro on 12/10/22.
//

import Foundation

public struct DogFactData {
    public let factMessage: String
}

fileprivate extension DogFactDTO {
    var toData: DogFactData {
        return DogFactData(
            factMessage: facts.reduce(into: "",  { $0.append($1) } )
        )
    }
}
