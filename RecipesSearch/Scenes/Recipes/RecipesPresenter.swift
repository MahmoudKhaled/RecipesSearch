//  RecipesPresenter.swift

import Foundation

class RecipesPresenter: RecipesPresenterProtocol, RecipesInteractorOutputProtocol {
    
    weak var view: RecipesViewProtocol?
    private let interactor: RecipesInteractorInputProtocol
    private let router: RecipesRouterProtocol
    
    init(view: RecipesViewProtocol, interactor: RecipesInteractorInputProtocol, router: RecipesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
