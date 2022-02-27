//  IngredientsUITableViewCell.swift

import UIKit

class IngredientsUITableViewCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet private weak var ingredientTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: String) {
        ingredientTitleLabel.text = model
    }
    
}
