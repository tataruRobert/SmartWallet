//
//  TransactionController.swift
//  SmartWallet
//
//  Created by Tataru Robert on 31/10/2020.
//

import Foundation
import UIKit
import CoreData

class TransactionController {
    
   static let shared = TransactionController()
    
    func addTransaction(amount: Double , date: String, location: String, isImportant: Bool = false, title: String, type: Int32 ) {
        Transaction(amount: amount, date: date, location: location, isImportant: isImportant, title: title, type: type, context: .mainContext)
        saveToPersistentStore()
    }
    
    func loadFromPersistentStore() -> [Transaction] {
        let fetchRequest: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        let context = NSManagedObjectContext.mainContext

        do {
            let transactionList = try context.fetch(fetchRequest)
            return transactionList
        } catch {
            NSLog("Error fetching wifi list: \(error)")
            return []
        }
    }
    
    
    func saveToPersistentStore() {
        let context = NSManagedObjectContext.mainContext

        do {
            try context.save()
        } catch {
            NSLog("Error saving main context: \(error)")
            context.reset()
        }
    }
    
}
