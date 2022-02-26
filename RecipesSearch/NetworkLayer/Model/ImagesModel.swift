
//  ImagesModel.swift

import Foundation

// MARK: - Images
struct ImagesResponse: Codable {
    let thumbnail, small, regular, large: ImageSizeType?
    
    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}

struct ImagesModel {
    let thumbnail, small, regular, large: ImageSizeTypeModel
    
    init(_ response: ImagesResponse?) {
        thumbnail = ImageSizeTypeModel(response?.thumbnail)
        small = ImageSizeTypeModel(response?.small)
        regular = ImageSizeTypeModel(response?.regular)
        large = ImageSizeTypeModel(response?.large)
    }
}

// MARK: - ImageSizeType
struct ImageSizeType: Codable {
    let url: String?
    let width, height: Double?
}

struct ImageSizeTypeModel {
    let url: String
    let width, height: Double
    
    init(_ response: ImageSizeType?) {
        url = response?.url ?? ""
        width = response?.width ?? 0.0
        height = response?.height ?? 0.0
    }
}
