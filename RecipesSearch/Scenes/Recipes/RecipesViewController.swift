//  RecipesViewController.swift

import UIKit

class RecipesViewController: BaseViewController, RecipesViewProtocol {
    
    //MARK: - outlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var healthFilterCollectionView: UICollectionView!
    @IBOutlet private weak var recipesTableView: UITableView!
    
    var presenter: RecipesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionViewList()
        setupTableViewList()
    }
    
    func reloadReciesData() {
        recipesTableView.reloadData()
    }
    
    func reloadHealthFilterData() {
        healthFilterCollectionView.reloadData()
    }
}


//MARK: - implementation of collectionView protocols
extension RecipesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    private func setupCollectionViewList() {
        healthFilterCollectionView.register(HealthTypeCollectionViewCell.nib, forCellWithReuseIdentifier: HealthTypeCollectionViewCell.identifier)
        healthFilterCollectionView.dataSource = self
        healthFilterCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfHealthFilterItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(type: HealthTypeCollectionViewCell.self, indexPath: indexPath)
        presenter.configureHealthTypeCell(cell: AnyConfigurableCell(cell), at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectHealthFilterItem(at: indexPath)
    }
}

//MARK: - implementation of tableView protocols
extension RecipesViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableViewList() {
        recipesTableView.register(RecipeTableViewCell.nib, forCellReuseIdentifier: RecipeTableViewCell.identifier)
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.tableFooterView = UIView()
        recipesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRecipesItemsRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(type: RecipeTableViewCell.self, indexPath: indexPath)
        presenter.configureRecipeCell(cell: AnyConfigurableCell(cell), at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRecipeItem(at: indexPath)
    }
}


//MARK: - implementation of searchBar delegation
extension RecipesViewController: UISearchBarDelegate {
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchButtonTapped()
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debugPrint(searchText)
        presenter.updateApiParameters(at: .searchKey(searchText))
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text.rangeOfCharacter(from: .letters) != nil {
            return true
        } else if text.rangeOfCharacter(from: NSCharacterSet.whitespacesAndNewlines) != nil {
            return true
        } else {
            presenter.wrongKeyBoardLetterTapped()
            return false
        }
    }
}
