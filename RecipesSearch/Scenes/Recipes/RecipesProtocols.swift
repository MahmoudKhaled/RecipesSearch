//  RecipesProtocols.swift

import Foundation

protocol RecipesRouterProtocol: BaseRouterProtocol {
    func navigate(to destination: RecipesDestination)
}

protocol RecipesPresenterProtocol: AnyObject {
    var view: RecipesViewProtocol? { get set }
    var numberOfRecipesItemsRows: Int { get }
    var numberOfHealthFilterItems: Int { get }
    var isEmptyData: Bool { get }
    func configureRecipeCell(cell: AnyConfigurableCell<RecipeModel>, at indexPath: IndexPath)
    func configureHealthTypeCell(cell: AnyConfigurableCell<HealthFilterType>, at indexPath: IndexPath)
    func didSelectHealthFilterItem(at indexPath: IndexPath)
    func didSelectRecipeItem(at indexPath: IndexPath)
    func updateApiParameters(at type: RecipeParametersType)
    func search()
    func wrongKeyBoardLetterTapped()
    func loadMoreRecipes()
}

protocol RecipesInteractorInputProtocol: AnyObject {
    var presenter: RecipesInteractorOutputProtocol? { get set }
    func search(with parameters: BodyParameters)
    func loadMore(with url: URL)
}

protocol RecipesInteractorOutputProtocol: AnyObject {
    func didFetchRecipesData(_ model: RecipesDataModel)
    func didFetchMoreRecipes(_ model: RecipesDataModel)
    func handleFetchedError(with error: Error)
}

protocol RecipesViewProtocol: HasActivityIndicator {
    var presenter: RecipesPresenterProtocol! { get set }
    func reloadReciesData(scrollToTop: Bool)
    func reloadHealthFilterData(at selectedIndex: IndexPath?)
}
