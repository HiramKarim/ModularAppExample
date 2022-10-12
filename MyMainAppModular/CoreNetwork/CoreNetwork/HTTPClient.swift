//
//  HTTPClient.swift
//  CoreNetwork
//
//  Created by Hiram Castro on 11/10/22.
//

import Foundation

public protocol HTTPClient {
    typealias ResponseResult = Result<Data, Error>
    typealias EscapingReturn = (ResponseResult) -> Void
    func get(_ url: URL?, responseHandler: @escaping EscapingReturn)
}
