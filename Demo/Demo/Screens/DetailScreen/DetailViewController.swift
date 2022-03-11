//
//  DetailViewController.swift
//  Demo
//
//  Created by admin on 11/03/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    let detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Detail"
        view.backgroundColor = .white
        
        [productImageView, titleLabel, subtitleLabel].forEach { (item) in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        let safeAreaLayout = view.safeAreaLayoutGuide
        
        // Layout productImageView
        productImageView.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 10).isActive = true
        productImageView.centerXAnchor.constraint(equalTo: safeAreaLayout.centerXAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 3 ).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor, multiplier: 1).isActive = true
        
        // Layout titleLabel
        titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
        // Layout subtitleLabel
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
        detailViewModel.delegate = self
        detailViewModel.getData()
    }
}

extension DetailViewController:DetailViewModelEvents {
    func gotData(isData: Bool) {
        if isData {
            DispatchQueue.main.async {
                self.productImageView.setImageWithUrl(url: self.detailViewModel.imageProduct)
                self.titleLabel.text = "Title: " + self.detailViewModel.title
                self.subtitleLabel.text = "Subtitle: " + self.detailViewModel.subtitle
            }
        }
    }
}
