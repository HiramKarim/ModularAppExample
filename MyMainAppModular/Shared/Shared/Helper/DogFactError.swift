//
//  DogFactError.swift
//  Shared
//
//  Created by Hiram Castro on 12/10/22.
//

import Foundation

public enum DogFactError: Error {
  case fetchError(Error)
  case notParsable(Data)
}
