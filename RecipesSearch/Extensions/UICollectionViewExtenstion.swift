//  UICollectionViewExtenstion.swift

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
