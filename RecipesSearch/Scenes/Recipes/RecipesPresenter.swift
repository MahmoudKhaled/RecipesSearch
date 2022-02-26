//  RecipesPresenter.swift

import Foundation

class RecipesPresenter: RecipesPresenterProtocol {
    
    weak var view: RecipesViewProtocol?
    private let interactor: RecipesInteractorInputProtocol
    private let router: RecipesRouterProtocol
    
    init(view: RecipesViewProtocol, interactor: RecipesInteractorInputProtocol, router: RecipesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension RecipesPresenter: RecipesInteractorOutputProtocol {
    func didFetchRecipesData(_ model: RecipesDataModel) {
        view?.hideActivityIndicator()
    }
    
    func handleFetchedError(with error: Error) {
        view?.hideActivityIndicator()
        router.showAlert(with: error.localizedDescription)
    }
}
