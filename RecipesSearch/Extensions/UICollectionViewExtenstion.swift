//  UICollectionViewExtenstion.swift

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    
    func customSelect(at indexPath: IndexPath, position: ScrollPosition,
                       completion: ((IndexPath) -> Void)? = nil) {
        performBatchUpdates {
            self.selectItem(at: indexPath, animated: true, scrollPosition: position)
        } completion: { _ in
            completion?(indexPath)
        }
    }
}
