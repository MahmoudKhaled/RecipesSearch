
import Foundation

struct RecipeResponse: Codable {
    let uri: String?
    let label: String?
    let image: String?
    let images: ImagesResponse?
    let source: String?
    let url: String?
    let shareAs: String?
    let yield: Int?
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
    let label: String
    let image: String?
    let images: ImagesModel
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
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
    
    init(_ response: RecipeResponse?) {
        uri = response?.uri ?? ""
        label = response?.label ?? ""
        image = response?.image
        images = ImagesModel(response?.images)
        source = response?.source ?? ""
        url = response?.url ?? ""
        shareAs = response?.shareAs ?? ""
        yield = response?.yield ?? 0
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
    }
    
    
}
