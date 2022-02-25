//BaseViewController.swift

import UIKit

public class BaseViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        hideBackButtonTitle()
    }
}

extension BaseViewController: HasActivityIndicator {
    
    func showActivityIndicator(isUserInteractionEnabled: Bool) {
        view.showActivityIndicator(isUserInteractionEnabled: isUserInteractionEnabled)
    }
    
    func hideActivityIndicator() {
        view.hideActivityIndicator()
    }
    
}
