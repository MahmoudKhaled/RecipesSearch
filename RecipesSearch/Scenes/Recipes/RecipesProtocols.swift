//  RecipesProtocols.swift

import Foundation

protocol RecipesRouterProtocol: BaseRouterProtocol {
    
}

protocol RecipesPresenterProtocol: AnyObject {
    var view: RecipesViewProtocol? { get set }
    var numberOfRecipesItemsRows: Int { get }
    var numberOfHealthFilterItems: Int { get }
    func configureRecipeCell(cell: AnyConfigurableCell<RecipeModel>, at indexPath: IndexPath)
    func configureHealthTypeCell(cell: AnyConfigurableCell<HealthFilterType>, at indexPath: IndexPath)
    func didSelectHealthFilterItem(at indexPath: IndexPath)
    func didSelectRecipeItem(at indexPath: IndexPath)
    func updateApiParameters(at type: RecipeParametersType)
    func searchButtonTapped()
    func wrongKeyBoardLetterTapped()
}

protocol RecipesInteractorInputProtocol: AnyObject {
    var presenter: RecipesInteractorOutputProtocol? { get set }
    func search(with parameters: BodyParameters)
}

protocol RecipesInteractorOutputProtocol: AnyObject {
    func didFetchRecipesData(_ model: RecipesDataModel)
    func handleFetchedError(with error: Error)
}

protocol RecipesViewProtocol: HasActivityIndicator {
    var presenter: RecipesPresenterProtocol! { get set }
    func reloadReciesData()
    func reloadHealthFilterData()
}
