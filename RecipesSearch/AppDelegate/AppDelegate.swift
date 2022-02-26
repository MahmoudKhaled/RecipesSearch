//
//  AppDelegate.swift

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setWindow()
        setupKeyboard()
        startApp()
        return true
    }
    
    private func setWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    private func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    func setRootViewController(_ viewController: UIViewController, animated: Bool) {
        window?.rootViewController = MainNavigationController(rootViewController: viewController)
    }
    
    func startApp() {
        setRootViewController(RecipesRouter.createModule(), animated: false)
    }

}

