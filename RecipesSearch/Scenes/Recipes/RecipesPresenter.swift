//  RecipesPresenter.swift

import Foundation

class RecipesPresenter: RecipesPresenterProtocol {
    
    weak var view: RecipesViewProtocol?
    private let interactor: RecipesInteractorInputProtocol
    private let router: RecipesRouterProtocol
    private var recipes: [RecipeModel] = []
    private var healthTypes: [HealthFilterType] = []
    private var apiParameters = RecipeParameters()
    
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
    
    func configureRecipeCell(cell: AnyConfigurableCell<RecipeModel>, at indexPath: IndexPath) {
        cell.configure(model: recipes[indexPath.row])
    }
    
    func configureHealthTypeCell(cell: AnyConfigurableCell<HealthFilterType>, at indexPath: IndexPath) {
        cell.configure(model: healthTypes[indexPath.item])
    }
    
    func didSelectRecipeItem(at indexPath: IndexPath) {
        //TODO: - navigate to recipeDetails
    }
    
    func didSelectHealthFilterItem(at indexPath: IndexPath) {
        updateApiParameters(at: .healthType(healthTypes[indexPath.item]))
        guard isValidSeachWord() else { return }
        recipes.removeAll()
        view?.reloadReciesData()
        prformSearchRequest()
    }
}

//MARK: implementation of RecipesPresenterProtocol
extension RecipesPresenter {
    
    func searchButtonTapped() {
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
    
    private func isValidSeachWord() -> Bool {
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
    
    private func createHealthFilteredType() {
        healthTypes = [.all, .lowSugar, .keto, .vegan]
    }
}

//MARK: implementation of RecipesInteractorOutputProtocol
extension RecipesPresenter: RecipesInteractorOutputProtocol {
    func didFetchRecipesData(_ model: RecipesDataModel) {
        view?.hideActivityIndicator()
        print(model.totalPages)
        recipes.append(contentsOf: model.recipes)
        createHealthFilteredType()
        view?.reloadHealthFilterData()
        view?.reloadReciesData()
    }
    
    func handleFetchedError(with error: Error) {
        view?.hideActivityIndicator()
        router.showAlert(with: error.localizedDescription)
    }
}
