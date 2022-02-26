//
//  Messsage.swift
//  NutritionAnalysis
//
//  Created by Mahmoud Khaled on 7/10/21.
//

import Foundation

enum Messages {
    case appName
    case ok
    case cancel
    case emptySearchError
    case wrongLetter
    
    var message: String {
        switch self {
        case .appName:
            return "Recipes Search"
        case .ok:
            return NSLocalizedString("Ok", comment: "")
        case .cancel:
            return NSLocalizedString("Cancel", comment: "")
        case .emptySearchError:
            return NSLocalizedString("Please enter your search word", comment: "")
        case .wrongLetter:
            return NSLocalizedString("Sorry Only english letters available, No special letters and numbers", comment: "")
        }
    }
}
