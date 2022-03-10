//
//  DetailViewModel.swift
//  Demo
//
//  Created by admin on 08/03/2022.
//

import Foundation

protocol DetailViewModelEvents: AnyObject {
    func gotData(isData: Bool)
}


class DetailViewModel {
    var itemProduct: Product = Product()
    
    var imageProduct: String = ""
    var title: String = ""
    var subtitle: String = ""
    
    weak var delegate: DetailViewModelEvents?
    
    func getData() {
        self.imageProduct = itemProduct.image
        self.title = itemProduct.title
        self.subtitle = itemProduct.subtitle
        
        delegate?.gotData(isData: true)
    }
}
