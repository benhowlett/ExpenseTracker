//
//  ExpenseManager.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-01.
//

import Foundation

class HomeViewController: ObservableObject {
    private(set) var expenses: [Expense] = []
    let monthYearDateFormatter = DateFormatter()
    
    // Define the initial set of default categories here. This will be user editable.
    private(set) var categories = [
        Category(name: "Salary", color: .green, symbol: .dollar),
        Category(name: "Housing", color: .yellow, symbol: .house),
        Category(name: "Groceries", color: .blue, symbol: .carrot),
        Category(name: "Fuel", color: .orange, symbol: .fuel),
        Category(name: "Travel", color: .mint, symbol: .airplane),
        Category(name: "Restaurant", color: .indigo, symbol: .restaurant),
        Category(name: "Takeout", color: .cyan, symbol: .takeout)
    ]
        
    func addExpense(_ expense: Expense) {
        expenses.append(expense)
    }
    
    func removeExpense(atID id: UUID) {
        for _ in expenses {
            if let index = expenses.firstIndex(where: {$0.id == id}) {
                expenses.remove(at: index)
            }
        }
    }
    
    func getCurrentBalance() -> Double {
        var total: Double = 0
        for expense in expenses {
            total += expense.amount
        }
        return total
    }
    
    func getIncome() -> Double {
        var total: Double = 0
        for expense in expenses {
            if expense.amount >= 0 {
                total += expense.amount
            }
        }
        return total
    }
    
    func getExpense() -> Double {
        var total: Double = 0
        for expense in expenses {
            if expense.amount < 0 {
                total += expense.amount * -1
            }
        }
        return total
    }
    
    func getLatestEntryMonth() -> String {
        monthYearDateFormatter.dateFormat = "MMMM yyyy"
        if expenses.isEmpty {
            return ""
        } else {
            var latestDate = Date(timeIntervalSince1970: 0)
            for expense in expenses {
                if expense.date > latestDate {
                    latestDate = expense.date
                }
            }
            return monthYearDateFormatter.string(from: latestDate)
        }
    }
    
    func getUsedCategories() -> [Category] {
        var categories: [Category] = []
        for expense in expenses {
            if !categories.contains(expense.category) {
                categories.append(expense.category)
            }
        }
        return categories
    }
}
