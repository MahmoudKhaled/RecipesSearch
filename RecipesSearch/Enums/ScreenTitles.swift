//  ScreenTitles.swift

import Foundation

public enum ScreenTitles {
    case recipesSearch
    case recipeDetails
    
    var title: String {
        switch self {
        case .recipesSearch:
            return NSLocalizedString("Recipes Search", comment: "")
        case .recipeDetails:
            return NSLocalizedString("Recipe Details", comment: "")
        }
    }
}
