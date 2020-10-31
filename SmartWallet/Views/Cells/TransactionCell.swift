//
//  TableViewCell.swift
//  SmartWallet
//
//  Created by Tataru Robert on 31/10/2020.
//

import Foundation
import UIKit

class TransactionCell: UITableViewCell {
    
    var iconImageView = UIImageView()
    var activityLabel = UILabel()
    var activityDate = UILabel()
    
    var transaction: Transaction?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureIcon() {
        contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .center

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
        ])
        
        guard let transaction = transaction else {return}
        
        if transaction.type == 0 {
            iconImageView.tintColor = .green
            iconImageView.image = UIImage(systemName: "plus")
        }else {
            iconImageView.tintColor = .red
            iconImageView.image = UIImage(systemName: "minus")
        }
        
        
    }
}


