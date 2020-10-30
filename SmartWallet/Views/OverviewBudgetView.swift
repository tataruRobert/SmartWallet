//
//  OverviewBudgetView.swift
//  SmartWallet
//
//  Created by Tataru Robert on 29/10/2020.
//

import Foundation
import UIKit

class OverviewBudgetView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureLayout()
    }
    
    func configureView() {
        clipsToBounds = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLayout() {
        let balanceView = BalanceView(frame: .zero, title: "Balance", color: .blue)
        let incomeView = BalanceView(frame: .zero, title: "Income", color: .purple)
        let expeneseView = BalanceView(frame: .zero, title: "Expense", color: .red)
        
    
        let lowerStack = UIStackView.fillStackView(axis: .horizontal, spacing: 20, with: [incomeView, expeneseView])
        let grandStack = UIStackView.fillStackView(axis: .vertical, spacing: 20, with: [balanceView, lowerStack])
        
        lowerStack.distribution = .fillEqually
        
        
        addSubview(grandStack)
        grandStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            grandStack.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            grandStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            grandStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            grandStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
