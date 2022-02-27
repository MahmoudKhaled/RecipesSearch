//  HealthTypeCollectionViewCell.swift

import UIKit

class HealthTypeCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    
    @IBOutlet private weak var healthTypeTitleLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            handleSelecteItem(isSelected: isSelected)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: HealthFilterType) {
        healthTypeTitleLabel.text = model.title
    }
    
    private func handleSelecteItem(isSelected: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.contentView.backgroundColor = isSelected ? .blue.withAlphaComponent(0.5) : .white
            self.healthTypeTitleLabel.textColor = isSelected ? .white : .black
        }
    }
}
