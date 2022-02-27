//  IngredientsUITableViewCell.swift

import UIKit

final class IngredientsUITableViewCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet private weak var ingredientTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: String) {
        ingredientTitleLabel.text = model
    }
    
}
