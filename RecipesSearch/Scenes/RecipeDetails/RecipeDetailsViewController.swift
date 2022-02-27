
//  RecipeDetailsViewController.swift

import UIKit

class RecipeDetailsViewController: BaseViewController, RecipeDetailsViewProtocol {
    
    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var recipeTitleLabel: UILabel!
    @IBOutlet private weak var ingredientsTableView: UITableView!
    
    var presenter: RecipeDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewList()
        setupBarButtonItems()
        presenter.viewDidLoad()
    }
    
    private func setupBarButtonItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
    }
    
    @objc private func shareButtonTapped() {
        presenter.shareRecipeButtonTapped()
    }
    
    func setRecipeData(with model: RecipeModel) {
        recipeImageView.load(imageUrl: model.image)
        recipeTitleLabel.text = model.title
    }
    
    func reloadIngredientsData() {
        ingredientsTableView.reloadData()
    }
}



extension RecipeDetailsViewController {
    @IBAction func recipeWebsiteTapped(_ sender: UIButton) {
        presenter.recipeWebSiteButtonTapped()
    }
}

//MARK: - implementation of tableView protocols
extension RecipeDetailsViewController: UITableViewDataSource {
    
    private func setupTableViewList() {
        ingredientsTableView.register(IngredientsUITableViewCell.nib, forCellReuseIdentifier: IngredientsUITableViewCell.identifier)
        ingredientsTableView.dataSource = self
        ingredientsTableView.tableFooterView = UIView()
        ingredientsTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfIngredientItemsRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(type: IngredientsUITableViewCell.self, indexPath: indexPath)
        presenter.configureIngredientCell(cell: AnyConfigurableCell(cell), at: indexPath)
        return cell
    }
}
