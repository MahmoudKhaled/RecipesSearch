//
//  RecipesProtocols.swift
//  RecipesSearch
//
//  Created by Mahmoud Khaled on 25/02/2022.
//

import Foundation

protocol RecipesRouterProtocol: BaseRouterProtocol {
    
}

protocol RecipesPresenterProtocol: AnyObject {
    var view: RecipesViewProtocol { get set }
}

protocol RecipesInteractorInputProtocol: AnyObject {
    var presenter: RecipesInteractorOutputProtocol { get set }
}

protocol RecipesInteractorOutputProtocol: AnyObject {
    
}

protocol RecipesViewProtocol: HasActivityIndicator {
    var presenter: RecipesPresenterProtocol! { get set }
}
