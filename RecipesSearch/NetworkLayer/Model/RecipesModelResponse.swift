//  RecipesModelResponse.swift

import Foundation

// MARK: - RecipesModelResponse
struct RecipesDataResponse: Codable {
    let from, to, count: Int?
    let links: nextRecipesModelResponseLinks?
    let hits: [Hit]?

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - RecipesModelResponseLinks
struct nextRecipesModelResponseLinks: Codable {
    let next: nextLinkResponse?
}

// MARK: - Next
struct nextLinkResponse: Codable {
    let href: String?
    let title: String?
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: RecipeResponse?
    let links: HitLinks?

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    let linksSelf: nextLinkResponse?
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

struct RecipesDataModel {
    let totalPages: Int
    let fromPage: Int
    let toPage: Int
    let nextPageLink: String
    let recipes: [RecipeModel]
    let hasPagination: Bool
    
    init(_ response: RecipesDataResponse?) {
        totalPages = response?.count ?? 1
        fromPage = response?.from ?? 1
        toPage = response?.to ?? 1
        recipes = response?.hits?.map({RecipeModel($0.recipe)}) ?? []
        nextPageLink = response?.links?.next?.href ?? ""
        hasPagination = toPage < totalPages
    }
}



