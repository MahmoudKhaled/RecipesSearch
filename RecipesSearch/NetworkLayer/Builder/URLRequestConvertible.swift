//  URLRequestConveritble.swift

import Foundation
import Alamofire

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var urlPath: String { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    
}


extension URLRequestConvertible {
    
    var url: URL {
        return URL(string: Constants.baseUrl)!.appendingPathComponent(urlPath)
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
