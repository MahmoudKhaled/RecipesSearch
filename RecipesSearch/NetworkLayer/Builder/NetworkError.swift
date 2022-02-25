//  NetworkError.swift

import Foundation

enum NetworkError: Error, LocalizedError {
    case cancelled
    case noInternetConnection
    case invalidData
    case internalServerError
    case unknownError(String)
    case unauthorized
    case unverified
    case decodingFailed
    case emptyPlacemarks
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString("No Internet connection", comment: "")
        case .invalidData, .internalServerError:
            return NSLocalizedString("SomethingWentWrong", comment: "")
        case .unknownError(let error):
            return error
        case .cancelled:
            return NSLocalizedString("cancelled", comment: "")
        case .unauthorized:
            return NSLocalizedString("Unauthorized", comment: "")
        case .emptyPlacemarks:
            return NSLocalizedString("noPlaceMarks", comment: "")
        default:
            return ""
        }
    }
}
