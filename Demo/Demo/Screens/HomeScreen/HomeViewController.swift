//
//  HomeViewController.swift
//  Demo
//
//  Created by admin on 07/03/2022.
//

import UIKit


class HomeViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(cellType: ProductTableViewCell.self)
    }
    
    private func switchToDetailScreen(index: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Detail", bundle: .main)
        guard let detailViewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController else { return }
        detailViewController.modalPresentationStyle = .fullScreen
        detailViewController.detailViewModel.itemProduct = homeViewModel.listProduct[index.item]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch homeViewModel.listProduct[indexPath.row].subtitle.count {
        case 0...10:
            return 120
        default:
            return UITableView.automaticDimension
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.listProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(with: ProductTableViewCell.self, for: indexPath)
        let item = homeViewModel.listProduct[indexPath.row]
        itemCell.configCell(item: item)
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switchToDetailScreen(index: indexPath)
    }
}

