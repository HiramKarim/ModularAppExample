//
//  URLSessionHTTPClientError.swift
//  CoreNetwork
//
//  Created by Hiram Castro on 11/10/22.
//

import Foundation

public enum URLSessionHTTPClientError: Error {
    case error(Error)
    case unknown(Data?, URLResponse?, Error?)
}
