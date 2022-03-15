//
//  UIImageView+Extention.swift
//  Demo
//
//  Created by admin on 08/03/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageWithUrl(url: String) {
        let url = URL(string: url)
        self.kf.setImage(with: url)
    }
}
