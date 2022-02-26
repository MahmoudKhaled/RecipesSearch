//  RecipeDetailsRouter.swift

import UIKit

class RecipeDetailsRouter: BaseRouter, RecipeDetailsRouterProtocol {
    
    static func createModule(recipe: RecipeModel) -> UIViewController {
        let view = RecipeDetailsViewController.instance()
        let interactor = RecipeDetailsInteractor()
        let router = RecipeDetailsRouter()
        let presenter = RecipeDetailsPresenter(recipe: recipe, view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        view.title = ScreenTitles.recipeDetails.title
        return view
    }
    
}
