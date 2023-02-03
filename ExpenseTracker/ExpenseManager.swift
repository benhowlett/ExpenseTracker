//
//  ExpenseManager.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-01.
//

import Foundation

class ExpenseManager: ObservableObject {
    private(set) var expenses: [Expense] = []
    
    func addExpense(_ expense: Expense) {
        expenses.append(expense)
    }
}
