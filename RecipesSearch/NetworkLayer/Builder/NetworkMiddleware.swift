//  NetworkMiddleware.swift

import Foundation
import Alamofire

class NetworkMiddleware: RequestAdapter, RequestRetrier {
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
    

    lazy public var sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60
        let session = Session(configuration: configuration, interceptor: Interceptor(adapter: self, retrier: self))
        return session
    }()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var _urlRequest = urlRequest

        _urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        _urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        completion(.success(_urlRequest))
    }
    
}
