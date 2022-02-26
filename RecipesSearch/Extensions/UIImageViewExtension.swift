//  UIImageViewExtension.swift

import UIKit
import Kingfisher

extension  UIImageView {

    func load(imageUrl: String?, placeholder: UIImage? = nil) {
        guard let url = imageUrl, let path = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) else {
            print("Error in Image Link ")
            return
        }
        let imgurl = URL(string: path)
        var kf = self.kf
        kf.indicatorType = .activity
        kf.setImage(with: imgurl, placeholder: placeholder)
    }
}
