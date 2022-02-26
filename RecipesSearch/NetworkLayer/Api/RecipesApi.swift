//
//  RecipesApi.swift

import Foundation
import Alamofire

enum RecipesAPI: URLRequestConvertible {
    
    case search(BodyParameters)

    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let parameter): return parameter.body
        }
    }
    
    var urlPath: String {
        switch self {
        case .search: return "recipes/v2"
        }
    }
    

    var encoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.queryString
        }
    }
}
