//  RecipesPresenter.swift

import Foundation

class RecipesPresenter: RecipesPresenterProtocol {
    
    weak var view: RecipesViewProtocol?
    private let interactor: RecipesInteractorInputProtocol
    private let router: RecipesRouterProtocol
    private var recipes: [RecipeModel] = []
    private var healthTypes: [HealthFilterType] = []
    private var apiParameters = RecipeParameters()
    private var isFirstSearch: Bool = true
    
    init(view: RecipesViewProtocol, interactor: RecipesInteractorInputProtocol, router: RecipesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - implementation of lists dataSocurce and delegation
extension RecipesPresenter {
    var numberOfRecipesItemsRows: Int { return recipes.count}
    
    var numberOfHealthFilterItems: Int { return healthTypes.count}
    
    var isEmptyData: Bool { return recipes.isEmpty }
    
    func configureRecipeCell(cell: AnyConfigurableCell<RecipeModel>, at indexPath: IndexPath) {
        cell.configure(model: recipes[indexPath.row])
    }
    
    func configureHealthTypeCell(cell: AnyConfigurableCell<HealthFilterType>, at indexPath: IndexPath) {
        cell.configure(model: healthTypes[indexPath.item])
    }
    
    func didSelectRecipeItem(at indexPath: IndexPath) {
        router.navigate(to: .recipeDetails(recipes[indexPath.row]))
    }
    
    func didSelectHealthFilterItem(at indexPath: IndexPath) {
        updateApiParameters(at: .healthType(healthTypes[indexPath.item]))
//        guard isValidSeachWord() else { return }
//        recipes.removeAll()
//        view?.reloadReciesData()
//        prformSearchRequest()
        search()
    }
}

//MARK: implementation of RecipesPresenterProtocol
extension RecipesPresenter {
    func search() {
        guard isValidSeachWord() else { return }
        prformSearchRequest()
    }
    
    func updateApiParameters(at type: RecipeParametersType) {
        switch type {
        case .searchKey(let searhKey):
            apiParameters.searchKey = searhKey.trimmingCharacters(in: .whitespaces)
        case .healthType(let type):
            apiParameters.helathType = type
        }
    }
    
    func wrongKeyBoardLetterTapped() {
        router.showAlert(with: Messages.wrongLetter.message)
    }
    
    private func isValidApiParameters() -> Bool {
        guard !apiParameters.searchKey.isEmpty else {
            router.showAlert(with: Messages.emptySearchError.message)
            return false
        }
        return true
    }
    
    private func prformSearchRequest() {
        view?.showActivityIndicator(isUserInteractionEnabled: false)
        interactor.search(with: apiParameters)
    }
    
    private func createHealthFilteredTypeItmes() {
        guard isFirstSearch else { return }
        healthTypes = [.all, .lowSugar, .keto, .vegan]
        /**
         reload health type with first item as default Selection
         */
        view?.reloadHealthFilterData(at: IndexPath(item: 0, section: 0))
        isFirstSearch = false
    }
}

//MARK: implementation of RecipesInteractorOutputProtocol
extension RecipesPresenter: RecipesInteractorOutputProtocol {
    func didFetchRecipesData(_ model: RecipesDataModel) {
        view?.hideActivityIndicator()
        print(model.totalPages)
        recipes = model.recipes
        createHealthFilteredTypeItmes()
        view?.reloadReciesData()
    }
    
    func handleFetchedError(with error: Error) {
        view?.hideActivityIndicator()
        router.showAlert(with: error.localizedDescription)
    }
}
