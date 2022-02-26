//  RecipesProtocols.swift

import Foundation

protocol RecipesRouterProtocol: BaseRouterProtocol {
    
}

protocol RecipesPresenterProtocol: AnyObject {
    var view: RecipesViewProtocol? { get set }
}

protocol RecipesInteractorInputProtocol: AnyObject {
    var presenter: RecipesInteractorOutputProtocol? { get set }
}

protocol RecipesInteractorOutputProtocol: AnyObject {
    func didFetchRecipesData(_ model: RecipesDataModel)
    func handleFetchedError(with error: Error)
}

protocol RecipesViewProtocol: HasActivityIndicator {
    var presenter: RecipesPresenterProtocol! { get set }
}
