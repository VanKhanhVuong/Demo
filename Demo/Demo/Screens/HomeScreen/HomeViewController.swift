//
//  HomeViewController.swift
//  Demo
//
//  Created by admin on 07/03/2022.
//

import UIKit


class HomeViewController: UIViewController {
    
    private let productTableView = UITableView()
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.title = "Home"
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        
        let layout = view.safeAreaLayoutGuide
        view.addSubview(productTableView)
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        productTableView.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        productTableView.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        productTableView.topAnchor.constraint(equalTo: layout.topAnchor).isActive = true
        productTableView.bottomAnchor.constraint(equalTo: layout.bottomAnchor).isActive = true
        
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(cellType: ProductTableViewCell.self)
        
    }
    
    private func switchToDetailScreen(index: Int) {
        let detailViewControllertail = DetailViewController()
        detailViewControllertail.detailViewModel.itemProduct = homeViewModel.listProduct[index]
        navigationController?.pushViewController(detailViewControllertail, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate { }

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
        switchToDetailScreen(index: indexPath.row)
    }
}

