//  AlertBuilder.swift

import UIKit

final class AlertBuilder {
    
    private var alertController: UIAlertController
    
    public init(title: String? = nil, message: String? = nil, preferredStyle: UIAlertController.Style) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.view.tintColor = UIColor.blue
        
    }
    
    public func setPopoverPresentationProperties(sourceView: UIView? = nil, sourceRect:CGRect? = nil, barButtonItem: UIBarButtonItem? = nil, permittedArrowDirections: UIPopoverArrowDirection? = nil) -> Self {
        
        if let poc = alertController.popoverPresentationController {
            if let view = sourceView {
                poc.sourceView = view
            }
            if let rect = sourceRect {
                poc.sourceRect = rect
            }
            if let item = barButtonItem {
                poc.barButtonItem = item
            }
            if let directions = permittedArrowDirections {
                poc.permittedArrowDirections = directions
            }
        }
        
        return self
    }
    
    public func addAction(action: UIAlertAction) -> Self {
        alertController.addAction(action)
        return self
    }
    
    public func addAction(title: String = "", style: UIAlertAction.Style = .default, handler: @escaping (() -> ()) = { }) -> Self {
        alertController.addAction(UIAlertAction(title: title, style: style, handler: { _ in handler() }))
        return self
    }
    
    public func addAction(title: String = "", image: UIImage? , style: UIAlertAction.Style = .default, handler: @escaping (() -> ()) = { }) -> Self {
        if let image = image {
            let  action = UIAlertAction(title: title, style: style, handler: { _ in handler() })
            action.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
            alertController.addAction(action)
        } else {
            alertController.addAction(UIAlertAction(title: title, style: style, handler: { _ in handler() }))
        }

        return self
    }
    
    public func build() -> UIAlertController {
        return alertController
    }
}

public extension UIAlertController {
    func show(animated: Bool = true, completionHandler: (() -> ())? = nil) {
        var rootVC: UIViewController?
        
        if #available(iOS 13, *) {
            let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
            rootVC = keyWindow?.rootViewController
        } else {
            rootVC =  UIApplication.shared.keyWindow?.rootViewController
        }
        guard let rootVC = rootVC else { return }

        var forefrontVC = rootVC
        while let presentedVC = forefrontVC.presentedViewController {
            forefrontVC = presentedVC
        }
        
        if !(forefrontVC is UIAlertController) {
            forefrontVC.present(self, animated: animated, completion: completionHandler)
        }
    }
}

