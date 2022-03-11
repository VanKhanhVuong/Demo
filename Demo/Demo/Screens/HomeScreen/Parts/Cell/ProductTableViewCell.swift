//
//  ProductTableViewCell.swift
//  Demo
//
//  Created by admin on 08/03/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Remove selection effect
        self.selectionStyle = .none
    }
    
    func configCell(item: Product) {
        productImageView.setImageWithUrl(url: item.image)
        titleLabel.text = "Title: " + item.title
        subtitleLabel.text = item.subtitle.separate(every: 5, with: "\n")
    }
}
