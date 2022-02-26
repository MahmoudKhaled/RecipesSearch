//  RecipeTableViewCell.swift

import UIKit

class RecipeTableViewCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var recipeTitleLabel: UILabel!
    @IBOutlet private weak var recipehealthLabels: UILabel!
    @IBOutlet private weak var recipeSourceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: RecipeModel) {
        recipeImageView.load(imageUrl: model.image)
        recipeTitleLabel.text = model.title
        recipeSourceLabel.text = model.source
        recipehealthLabels.text = model.healthLabelTitels
    }
    
    
}
