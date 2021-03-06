//  RecipesInteractor.swift

import UIKit

final class RecipesInteractor: RecipesInteractorInputProtocol {
    
    weak var presenter: RecipesInteractorOutputProtocol?
    private let recipesWorkers = RecipesWorker()
    
    func search(with parameters: BodyParameters) {
        recipesWorkers.search(with: parameters) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let data = RecipesDataModel(response)
                self.presenter?.didFetchRecipesData(data)
            case .failure(let error):
                self.presenter?.handleFetchedError(with: error)
            }
        }
    }
    
    func loadMore(with url: URL) {
        recipesWorkers.loadMoreRecipes(with: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let data = RecipesDataModel(response)
                self.presenter?.didFetchMoreRecipes(data)
            case .failure(let error):
                self.presenter?.handleFetchedError(with: error)
            }
        }
    }
}
