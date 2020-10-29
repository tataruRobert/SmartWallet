//
//  BalanceView.swift
//  SmartWallet
//
//  Created by Tataru Robert on 29/10/2020.
//

import Foundation
import UIKit

class BalanceView: UIView {
    
    var totalBalanceText = UILabel()
    var totalBalanceSum = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect = .zero, title: String, color: UIColor) {
        super.init(frame: frame)
        configureView(color: color)
        configureLayout(title: title)
    }
    
    func configureView(color: UIColor) {
        clipsToBounds = true
        backgroundColor = color
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureLayout(title: String) {
        if title != "Balance" {
            totalBalanceText.text = title
            totalBalanceText.font = UIFont.roundedFont(ofSize: 25, weight: .heavy)
            totalBalanceText.textAlignment = .center
            totalBalanceText.tintColor = .white
            
            totalBalanceSum.text = "$0"
            totalBalanceSum.font = UIFont.roundedFont(ofSize: 30, weight: .heavy)
            totalBalanceSum.textAlignment = .center
            totalBalanceSum.tintColor = .white
            
        }else {
            totalBalanceText.text = "Total Balance"
            totalBalanceText.font = UIFont.roundedFont(ofSize: 40, weight: .heavy)
            totalBalanceText.textAlignment = .center
            totalBalanceText.tintColor = .white
            
            totalBalanceSum.text = "$0"
            totalBalanceSum.font = UIFont.roundedFont(ofSize: 60, weight: .heavy)
            totalBalanceSum.textAlignment = .center
            totalBalanceSum.tintColor = .white
        }
        
       
        
        let stackView = UIStackView.fillStackView(spacing: 10, with: [totalBalanceText, totalBalanceSum])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
