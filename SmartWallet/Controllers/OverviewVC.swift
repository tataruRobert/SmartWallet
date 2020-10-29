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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        view.backgroundColor = .red
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
                                                                        .font : UIFont.roundedFont(ofSize: 35, weight: .heavy)]
        navigationController?.navigationBar.titleTextAttributes = [
                                                                   .font : UIFont.roundedFont(ofSize: 20, weight: .bold)]
    }
    

   
}
