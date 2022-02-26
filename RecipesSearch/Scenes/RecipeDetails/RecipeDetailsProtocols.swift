
//  RecipeDetailsProtocols.swift

import Foundation

protocol RecipeDetailsRouterProtocol: BaseRouterProtocol {
    
}

protocol RecipeDetailsPresenterProtocol: AnyObject {
    var view: RecipeDetailsViewProtocol? { get set }
    var numberOfIngredientItemsRows: Int { get }
    func viewDidLoad()
    func configureIngredientCell(cell: AnyConfigurableCell<String>, at indexPath: IndexPath)
}

protocol RecipeDetailsInteractorInputProtocol: AnyObject {
    var presenter: RecipeDetailsInteractorOutputProtocol? { get set }
}

protocol RecipeDetailsInteractorOutputProtocol: AnyObject {
    
}

protocol RecipeDetailsViewProtocol: HasActivityIndicator {
    var presenter: RecipeDetailsPresenterProtocol! { get set }
    func setRecipeData(with model: RecipeModel)
    func reloadIngredientsData()
}
