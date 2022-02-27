//  RecipeDetailsRouter.swift

import UIKit
import SafariServices

enum RecipeDetailsDestination {
    case recipeWebPage(_ url: URL)
    case shareRecipe(_ url: URL)
}

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
    
    func navigate(to destination: RecipeDetailsDestination) {
        switch destination {
        case .recipeWebPage(let url):
            openRecipeWebPage(with: url)
        case .shareRecipe(let url):
            shareRecipe(url)
        }
    }
    
    private func openRecipeWebPage(with url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        viewController?.present(vc, animated: true)
    }
    
    private func shareRecipe(_ url: URL) {
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        viewController?.present(activityController, animated: true)
    }
    
}
