//
//  ExpenseManager.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-01.
//

import Foundation

class ExpenseManager: ObservableObject {
    private(set) var expenses: [Expense] = []
    let monthYearDateFormatter = DateFormatter()
        
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
}
