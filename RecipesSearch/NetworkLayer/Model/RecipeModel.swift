
import Foundation

struct RecipeResponse: Codable {
    let uri: String?
    let label: String?
    let image: String?
    let images: ImagesResponse?
    let source: String?
    let url: String?
    let shareAs: String?
    let yield: Double?
    let dietLabels: [String]?
    let healthLabels: [String]?
    let cautions: [String]?
    let ingredientLines: [String]?
    let ingredients: [IngredientResponse]?
    let calories, totalWeight: Double?
    let totalTime: Double?
    let cuisineType: [String]?
    let mealType: [String]?
    let dishType: [String]?
    let digest: [DigestResponse]?
}

struct RecipeModel {
    let uri: String
    let title: String
    let image: String?
    let images: ImagesModel
    let source: String
    let url: String
    let shareAs: String
    let yield: Double
    let dietLabels: [String]
    let healthLabels: [String]
    let cautions: [String]
    let ingredientLines: [String]
    let ingredients: [IngredientModel]
    let calories, totalWeight: Double
    let totalTime: Double
    let cuisineType: [String]
    let mealType: [String]
    let dishType: [String]
    let digest: [DigestModel]
    let healthLabelTitels: String
    
    init(_ response: RecipeResponse?) {
        uri = response?.uri ?? ""
        title = response?.label ?? ""
        image = response?.image
        images = ImagesModel(response?.images)
        source = response?.source ?? ""
        url = response?.url ?? ""
        shareAs = response?.shareAs ?? ""
        yield = response?.yield ?? 0.0
        dietLabels = response?.dietLabels ?? []
        healthLabels = response?.healthLabels ?? []
        cautions = response?.cautions ?? []
        ingredientLines = response?.ingredientLines ?? []
        ingredients = response?.ingredients?.map({IngredientModel($0)}) ?? []
        calories = response?.calories ?? 0.0
        totalWeight = response?.totalWeight ?? 0.0
        totalTime = response?.totalTime ?? 0.0
        cuisineType = response?.cuisineType ?? []
        mealType = response?.mealType ?? []
        dishType = response?.dishType ?? []
        digest = response?.digest?.map({DigestModel($0)}) ?? []
//        healthLabelTitels = healthLabels.reduce(into: "", { result, value in
//            result = result + value
//        })
//
        healthLabelTitels = healthLabels.joined(separator: ",")
    }
    
    
}
