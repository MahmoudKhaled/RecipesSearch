
//  UITableViewExtension.swift

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}
