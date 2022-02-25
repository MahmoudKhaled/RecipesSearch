//  Constants.swift

import Foundation

enum URLPath: String {
    case develop = ""
    case statge = "https://api.edamam.com"
}

struct Constants {

    //MARK:- Base URL
    static let url = URLPath.statge.rawValue
    static let baseUrl = "\(url)/api/"
    
    //MARK:- static App keys
    static let appId = "09386965"
    static let appKey = "a5f8f1bbc32fed570a25148d230a0b4b"
    static let recipeType = "public"
 
}
