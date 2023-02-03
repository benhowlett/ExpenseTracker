//
//  ExpenseTrackerView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import SwiftUI

struct ExpenseTrackerView: View {
    @ObservedObject var manager: ExpenseManager = ExpenseManager()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(manager.expenses) { expense in
                    ExpenseView(expense)
                }
            }
            .padding([.leading, .trailing])
        }
    }
}

struct ExpenseTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        let manager: ExpenseManager = ExpenseManager()
        manager.addExpense(Expense(amount: 100.00, name: "Test Expense 1", category: Category(name: "Travel", color: .blue, symbol: .travel), date: Date()))
        manager.addExpense(Expense(amount: -123.45, name: "Test Expense 2", category: Category(name: "Groceries", color: .green, symbol: .groceries), date: Date()))
        manager.addExpense(Expense(amount: 17.76, name: "Test Expense 3", category: Category(name: "Fuel", color: .orange, symbol: .fuel), date: Date()))
        manager.addExpense(Expense(amount: 2023.99, name: "Long Test Expense 4", category: Category(name: "Takeout", color: .mint, symbol: .takeout), date: Date()))
        manager.addExpense(Expense(amount: 1.00, name: "Long Test Expense 5", category: Category(name: "Housing", color: .red, symbol: .housing), date: Date()))
        manager.addExpense(Expense(amount: 100.00, name: "Long Test Expense 6", category: Category(name: "Entertainment", color: .cyan, symbol: .entertainment), date: Date()))
        return ExpenseTrackerView(manager: manager)
    }
}
