
//  UITableViewExtension.swift

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}

extension UITableView {
    func emptyMessage(info: EmptyViewDataSourceProtocol) {
        let messageLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 20.0)
            label.text = info.messageTitle
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let messageImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.image = info.emptyImage
            return image
        }()

        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(messageImageView)
            stackView.addArrangedSubview(messageLabel)
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .fill
            stackView.spacing = 20
            return stackView
        }()

        if info.emptyImage == nil {
            messageImageView.isHidden = false
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))

        backgroundView = view
        backgroundView!.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: frame.width - 16)
        ])
    }
}
