//
//  DetailViewController.swift
//  Demo
//
//  Created by admin on 08/03/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
//    @IBOutlet weak var closeImageView: UIImageView!
    
    var detailViewModel = DetailViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        detailViewModel.delegate = self
        detailViewModel.getData()
//        actionBackHome()
    }
    
//    // Button Back Home
//    private func actionBackHome() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(navigationHome))
//        closeImageView.addGestureRecognizer(tap)
//    }
//
//    @objc func navigationHome(sender : UITapGestureRecognizer) {
//        self.dismiss(animated: true, completion: nil)
//    }
}

extension DetailViewController:DetailViewModelEvents {
    func gotData(isData: Bool) {
        if isData {
//            DispatchQueue.main.async {
                self.productImageView.setImageWithUrl(url: self.detailViewModel.imageProduct)
                self.titleLabel.text = self.detailViewModel.title
                self.subtitleLabel.text = self.detailViewModel.subtitle
//            }
        }
    }
}
