//  IngredientModel.swift

import Foundation

struct IngredientResponse: Codable {
    let text: String?
    let quantity: Double?
    let measure: String?
    let food: String?
    let weight: Double?
    let foodCategory: String?
    let foodID: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

struct IngredientModel {
    let text: String
    let quantity: Double
    let measure: String
    let food: String
    let weight: Double
    let foodCategory: String
    let foodID: String
    let image: String?
    
    init(_ response: IngredientResponse?) {
        text = response?.text ?? ""
        quantity = response?.quantity ?? 0.0
        measure = response?.measure ?? ""
        food = response?.food ?? ""
        weight = response?.weight ?? 0.0
        foodCategory = response?.foodCategory ?? ""
        foodID = response?.foodID ?? ""
        image = response?.image
    }
}
