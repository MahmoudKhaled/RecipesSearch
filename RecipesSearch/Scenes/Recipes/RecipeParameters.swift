
//  RecipeParameters.swift

import Foundation

enum RecipeParametersType {
    case searchKey(String)
    case healthType(HealthFilterType)
}

struct RecipeParameters: BodyParameters {
    
    var appId: String = Constants.appId
    var appKey: String = Constants.appKey
    var searchKey: String = ""
    var helathType: HealthFilterType = .all
    var type: String = "public"
    
    var body: [String : Any] {
        var body = ["type": type,
                    "q": searchKey,
                    "app_id": appId,
                    "app_key": appKey]
        if helathType != .all {
            body["health"] = helathType.parameterKey
        }
        return body
    }
    
}
