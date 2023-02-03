//
//  ExpenseManager.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-01.
//

import Foundation

struct ExpenseManager {
    private(set) var expenses: [Expense] = []
    
    mutating func addExpense(_ expense: Expense) {
        expenses.append(expense)
    }
}
