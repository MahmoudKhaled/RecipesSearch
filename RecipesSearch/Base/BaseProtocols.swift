//  BaseProtocols.swift

import Foundation

protocol BaseRouterProtocol: AnyObject {
    func showAlert(with message: String)
}

protocol HasActivityIndicator: AnyObject {
    func showActivityIndicator(isUserInteractionEnabled: Bool)
    func hideActivityIndicator()
}
