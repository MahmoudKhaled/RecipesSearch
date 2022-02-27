//
//  RecipesWorker.swift

import Foundation

class RecipesWorker {
    
    private let networkHandler = NetworkHandler()
    
    func search(with parameters: BodyParameters, completionHandler: @escaping (Result<RecipesDataResponse, Error>)-> Void) {
        do {
            try networkHandler.request(RecipesAPI.search(parameters)).decoded(toType: RecipesDataResponse.self).observe(with: completionHandler)
        } catch {
            completionHandler(.failure(error))
        }
    }
    
    func loadMoreRecipes(with url: URL, completionHandler: @escaping (Result<RecipesDataResponse, Error>)-> Void) {
        do {
            try networkHandler.request(RecipesAPI.loadMoreRecipes(url: url)).decoded(toType: RecipesDataResponse.self).observe(with: completionHandler)
        } catch {
            completionHandler(.failure(error))
        }
    }
}
