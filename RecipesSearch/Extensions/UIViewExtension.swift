//  UIViewExtension.swift


import UIKit
import MBProgressHUD

//MARK:- Indicator methods

extension UIView {
    func showActivityIndicator(isUserInteractionEnabled: Bool) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.isUserInteractionEnabled = !isUserInteractionEnabled
        hud.restorationIdentifier = "activityIndicator"
    }
    
    func hideActivityIndicator() {
        for subview in subviews where subview.restorationIdentifier == "activityIndicator" {
            guard let hud = subview as? MBProgressHUD else { return }
            hud.hide(animated: true)
        }
    }
}

extension UIView
{
    public static var identifier : String
    {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    public static var nib: UINib
    {
        return .init(nibName: identifier, bundle: nil)
    }
}

extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        } get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        } get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.gray.cgColor)
        }
    }
    
}
