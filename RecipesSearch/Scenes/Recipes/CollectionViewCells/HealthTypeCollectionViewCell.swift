//  HealthTypeCollectionViewCell.swift

import UIKit

class HealthTypeCollectionViewCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet private weak var healthTypeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: HealthFilterType) {
        healthTypeTitleLabel.text = model.title
    }
}
