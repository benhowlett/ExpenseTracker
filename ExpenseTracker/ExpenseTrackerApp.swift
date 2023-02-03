//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-01-29.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        let expense = Expense(amount: 100.00, name: "Test Expense", category: Category(name: "Travel", color: .blue, symbol: .travel), date: Date())
        
        WindowGroup {
            ExpenseView(expense: expense)
        }
    }
}
