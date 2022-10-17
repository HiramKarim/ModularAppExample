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
    
    public func get(_ url: URL?, responseHandler: @escaping EscapingReturn) {
        
        guard let url = url else { return }
        
        session.dataTask(with: url) { data, response, error in
            let handledResponse = Self.handle(data: data, error: error, response: response)
            switch handledResponse {
            case .success(let _data):
              responseHandler(.success(_data))
            case .failure(let _error):
              responseHandler(.failure(_error))
            }
        }.resume()
    }
    
}

extension URLSessionHTTPClient {
    internal static func handle(data: Data?, error: Error?, response: URLResponse?) -> Result<Data,URLSessionHTTPClientError> {
        if let _data = data,
               error == nil,
               let _response = response,
               let _ = _response as? HTTPURLResponse
            {
              return .success(_data)
            }
        
        if let _error = error {
            return .failure(.error(_error))
        }
        
        return .failure(.unknown(data, response, error))
    }
}
