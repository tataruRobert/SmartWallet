//
//  Transaction+Convenience.swift
//  SmartWallet
//
//  Created by Tataru Robert on 31/10/2020.
//

import Foundation
import CoreData

extension Transaction {
    @discardableResult convenience init(amount: Double , date: String, location: String, isImportant: Bool = false,
                                        title: String, type: Int32 , context: NSManagedObjectContext) {
        self.init(context: context)
        self.amount = amount
        self.date = date
        self.location = location
        self.isImportant = isImportant
        self.title = title
        self.type = type
    }
}
