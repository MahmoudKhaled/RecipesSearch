//  RecipeDetailsPresenter.swift

import Foundation

class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    weak var view: RecipeDetailsViewProtocol?
    private let interactor: RecipeDetailsInteractorInputProtocol
    private let router: RecipeDetailsRouterProtocol
    private let recipe: RecipeModel
    
    init(recipe: RecipeModel, view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorInputProtocol, router: RecipeDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.recipe = recipe
    }
}

extension RecipeDetailsPresenter {
    
    var numberOfIngredientItemsRows: Int { return recipe.ingredientLines.count}
        
    func viewDidLoad() {
        view?.setRecipeData(with: self.recipe)
        view?.reloadIngredientsData()
    }
    
    func configureIngredientCell(cell: AnyConfigurableCell<String>, at indexPath: IndexPath) {
        cell.configure(model: recipe.ingredientLines[indexPath.row])
    }
    
    func recipeWebSiteButtonTapped() {
        if let url = URL(string: recipe.url) {
            router.navigate(to: .recipeWebPage(url))
        }
    }
    
    func shareRecipeButtonTapped() {
        if let url = URL(string: recipe.url) {
            router.navigate(to: .shareRecipe(url))
        }
    }
}

extension RecipeDetailsPresenter: RecipeDetailsInteractorOutputProtocol {
    
}
