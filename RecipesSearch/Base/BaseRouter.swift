//  BaseRouter.swift

import UIKit

class BaseRouter: BaseRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func showAlert(with message: String) {
        viewController?.showAlert(with: message)
    }
}
