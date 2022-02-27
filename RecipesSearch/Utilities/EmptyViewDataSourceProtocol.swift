
//  RecipesSearch

import Foundation
import UIKit

public protocol EmptyViewDataSourceProtocol {
    var messageTitle: String? { get }
    var emptyImage: UIImage? { get }
}

public struct EmptySearchData: EmptyViewDataSourceProtocol {
    public var messageTitle: String? {
        return Messages.noSearchResult.message
    }
    
    public var emptyImage: UIImage? = nil
}

public struct HideEmptyData: EmptyViewDataSourceProtocol {
    public var messageTitle: String? = ""
    public var emptyImage: UIImage? = nil
}
