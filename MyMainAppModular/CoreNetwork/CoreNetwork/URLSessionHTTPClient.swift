//
//  URLSessionHTTPClient.swift
//  CoreNetwork
//
//  Created by Hiram Castro on 12/10/22.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func get(_ url: URL, responseHandler: @escaping (ResponseResult) -> Void) {
        session.dataTask(with: url) { data, response,, error in
            let handledResponse = Self.han
        }.resume()
    }
    
}

extension URLSessionHTTPClient {
    internal static func handle(data: Data?, error: Error?, response: URLResponse?) -> Result<Data,URLSessionHTTPClientError> {
        if let _data = data,
           error == nil,
           let _response = response,
           let _ = _response as? HTTPURLResponse {
            return .success(data)
        }
        
        if let _error = error {
            return .failure(.error(_error))
        }
        
        return .failure(.unknown(data, response, error))
    }
}
