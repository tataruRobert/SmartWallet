//
//  OverviewVC.swift
//  SmartWallet
//
//  Created by Tataru Robert on 29/10/2020.
//

import UIKit

func makeOverviewVC() -> UINavigationController {
    let vc = OverviewVC()
    vc.title = "Overview"
    vc.tabBarItem = UITabBarItem(title: vc.title, image: UIImage(systemName: "house"), tag: 0)
  
    let nvc = UINavigationController(rootViewController: vc)
    return nvc
}

class OverviewVC: UIViewController {
    
    private let overviewBudgetView = OverviewBudgetView()
    private let transactionsTableView = UITableView(frame: .zero, style: .plain)
    
    private let addButton = UIButton(type: .system)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureOverview()
        confiugureTableView()
        configureRoundButton()
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
                                                                        .font : UIFont.roundedFont(ofSize: 35, weight: .heavy)]
        navigationController?.navigationBar.titleTextAttributes = [
                                                                   .font : UIFont.roundedFont(ofSize: 20, weight: .bold)]
    }
    
    func configureOverview() {
        view.addSubview(overviewBudgetView)
        
        NSLayoutConstraint.activate([
            overviewBudgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            overviewBudgetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            overviewBudgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewBudgetView.heightAnchor.constraint(equalToConstant: 330)

        ])
       
    }
    
    func confiugureTableView() {
        view.addSubview(transactionsTableView)
        transactionsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        transactionsTableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
        
        NSLayoutConstraint.activate([
            transactionsTableView.topAnchor.constraint(equalTo: overviewBudgetView.bottomAnchor, constant: 10),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
        
       transactionsTableView.dataSource = self
       transactionsTableView.delegate = self
        transactionsTableView.separatorStyle = .singleLine
       transactionsTableView.backgroundColor = .black
       transactionsTableView.allowsMultipleSelection = false
       transactionsTableView.allowsSelectionDuringEditing = true
       transactionsTableView.allowsMultipleSelectionDuringEditing = true
        
    }
    
    func configureRoundButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(roundButtonTapped(_:)), for: .touchUpInside)
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        addButton.setImage(UIImage(systemName: "plus.circle.fill", withConfiguration: configuration), for: .normal)
        
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func roundButtonTapped(_ sender: UIButton) {
//        if self.isEditing == false{
//            let addWifiVC = AddWifiVC()
//
//            let navController = UINavigationController(rootViewController: addWifiVC)
//            navController.modalPresentationStyle = .automatic
//            present(navController, animated: true)
//
//        }else {
//            deleteSelectedWiFiNetworks()
//        }
    }
    
    
}

extension OverviewVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell
        
        
        return cell ?? UITableViewCell()
    }
    
    
}
