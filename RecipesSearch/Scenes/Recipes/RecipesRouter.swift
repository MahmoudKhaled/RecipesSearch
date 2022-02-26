//  RecipesRouter.swift

import UIKit

enum RecipesDestination {
    case recipeDetails(RecipeModel)
}

class RecipesRouter: BaseRouter, RecipesRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = RecipesViewController.instance()
        let interactor = RecipesInteractor()
        let router = RecipesRouter()
        let presenter = RecipesPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return view
    }
    
    func navigate(to destination: RecipesDestination) {
        switch destination {
        case .recipeDetails(let recipeModel):
            viewController?.push(RecipeDetailsRouter.createModule(recipe: recipeModel))
        }
    }
    
}
