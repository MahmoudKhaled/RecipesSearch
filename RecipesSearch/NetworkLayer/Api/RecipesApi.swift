//
//  RecipesApi.swift

import Foundation
import Alamofire

enum RecipesAPI: URLRequestConvertible {
    
    case search(BodyParameters)
    case loadMoreRecipes(url: URL)

    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let parameter): return parameter.body
        default: return nil
        }
    }
    
    var urlPath: String {
        switch self {
        case .search: return "recipes/v2"
        default: return ""
        }
    }
    
    var url: URL {
        switch self {
        case .loadMoreRecipes(let url):
            return url
        default:
            return URL(string: Constants.baseUrl)!.appendingPathComponent(urlPath)
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .search:
            return URLEncoding.queryString
        default:
            return URLEncoding.default
        }
    }
}
