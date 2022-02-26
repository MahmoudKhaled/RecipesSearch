
//  HealthFilterType.swift

import Foundation

enum HealthFilterType {

    case all
    case lowSugar
    case keto
    case vegan
    
    var title: String {
        switch self {
        case .all:
            return "All"
        case .lowSugar:
            return "Low Sugar"
        case .keto:
            return "Keto"
        case .vegan:
            return "Vegan"
        }
    }
    
    var parameterKey: String {
        switch self {
        case .all:
            return ""
        case .lowSugar:
            return "low-sugar"
        case .keto:
            return "keto-friendly"
        case .vegan:
            return "vegan"
        }
    }
}
