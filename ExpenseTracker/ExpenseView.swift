//
//  ExpenseView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-01-29.
//

import SwiftUI

struct ExpenseView: View {
    var expense: Expense
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ExpenseView_Previews: PreviewProvider {
    
    static var previews: some View {
        let expense = Expense(amount: 100, name: "Test Expense", category: Category(name: "Travel", color: .blue, symbol: .travel), date: Date())
        
        ExpenseView(expense: expense)
    }
}
