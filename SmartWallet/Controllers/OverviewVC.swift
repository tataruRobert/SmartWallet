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
    
    var overviewBudgetView = OverviewBudgetView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureLayout()
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
                                                                        .font : UIFont.roundedFont(ofSize: 35, weight: .heavy)]
        navigationController?.navigationBar.titleTextAttributes = [
                                                                   .font : UIFont.roundedFont(ofSize: 20, weight: .bold)]
    }
    func configureLayout() {
        view.addSubview(overviewBudgetView)
        
        NSLayoutConstraint.activate([
            overviewBudgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            overviewBudgetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            overviewBudgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewBudgetView.heightAnchor.constraint(equalToConstant: 330)

        ])
       
    }
    

   
}
