//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-01-29.
//

import Foundation

struct Expense {
    var amount: Float
    var name: String
    var description: String?
    var category: Category
}

// All possible expense or income categories should be defined here.
//
// TODO: Add all initial categories
// TODO: (Stretch Goal) Add ability for user to create new categories using whatever SF Symbol they want
struct Category {
    let name: String
    let color: UIColor
    let symbol: Symbol
    
    enum Symbol: String {
        case travel = "airplane"
        case groceries = "carrot"
        case fuel = "fuelpump"
        case takeout = "takeoutbag.and.cup.and.straw"
        case restaurant = "fork.knife"
        case entertainment = "theatermasks"
    }
}
