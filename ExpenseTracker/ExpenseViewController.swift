//
//  ExpenseViewController.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-01.
//

import SwiftUI

class ExpenseViewController: ObservableObject {
    @Published private var manager = ExpenseManager()
    
    func getExpenses() -> [Expense] {
        manager.expenses
    }
    
}
