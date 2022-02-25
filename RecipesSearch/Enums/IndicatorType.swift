//  IndicatorType.swift

import Foundation

public enum IndicatorState {
    case loading(userInterAction: Bool, hideView: Bool)
    case loaded
    case none
}
