//  UIViewControllerExtension.swift

import UIKit

// MARK:- InstanceViewController from stoaryBoard
public extension UIViewController
{
    private static var nameOfVC: String
    {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    fileprivate class func instate<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T
    {
        return (storyboard.instantiateViewController(withIdentifier: identifier) as? T)!
    }
    
    class func instance(_ storyboard: StoryBoardTypes = .main) -> Self
    {
        let stb = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return instate(stb, identifier: nameOfVC)
    }
}

// MARK:- Show default alert for app
public extension UIViewController {
    func showAlert(with message: String) {
        AlertBuilder(title: Messages.appName.message, message: message, preferredStyle: .alert)
            .addAction(title: Messages.ok.message, style: .default)
            .build()
            .show()
    }
}

// MARK:- Navigation metthods and setup Main settings of it
extension UIViewController {
    
    func hideBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop(_ viewController: UIViewController) {
        navigationController?.popToViewController(viewController, animated: true)
    }
    
}

//MARK:- Extension for setup show and hide loading indicator
extension UIViewController {    
    //show and hide HUDProgress
     func indicatorState(state: IndicatorState) {
        switch state {
        case .loading(let userInterAction, let hideView ):
            if hideView {
                let _ = view.subviews.map({$0.isHidden = true})
            }
            view.showActivityIndicator(isUserInteractionEnabled: userInterAction)
            
        case .loaded:
            let _ = view.subviews.map({$0.isHidden = false})
            view.hideActivityIndicator()
        case .none:
            break
        }
    }
}
