//
//  RecipesRouter.swift
//  RecipesSearch
//
//  Created by Mahmoud Khaled on 25/02/2022.
//

import UIKit

class RecipesRouter: BaseRouter, RecipesRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = RecipesViewController()
        let interactor = RecipesInteractor()
        let router = RecipesRouter()
        let presenter = RecipesPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return view
    }
    
}
