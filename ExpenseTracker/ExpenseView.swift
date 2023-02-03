//
//  ExpenseView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-01-29.
//

import SwiftUI

struct ExpenseView: View {
    @Environment(\.colorScheme) var colorScheme
    var expense: Expense
    let listDateFormatter = DateFormatter()
    
    init(_ expense: Expense) {
        self.expense = expense
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill((colorScheme == .light ? Color.white : Color.init(red: 0.07, green: 0.07, blue: 0.07)).shadow(.drop(color: .black, radius: 10, x: 7, y: 7)))
                .frame(maxHeight: 80)
//                .padding()
            HStack {
                Image(systemName: expense.category.symbol.rawValue)
                    .frame(width: 50, height: 50)
                    .background(expense.category.color.opacity(0.5))
                    .foregroundColor(expense.category.color)
                    .font(.title)
                    .clipShape(Circle())
//                    .padding()
                VStack(alignment: .leading){
                    Text(expense.name)
                        .font(.title3)
                    Spacer()
                    Text(formatDateForListView())
                        .font(.subheadline)
                        .foregroundColor(.primary.opacity(0.75))
                }
                .padding([.bottom, .top], 10)
                Spacer()
                Text(generateAmountString())
//                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(expense.amount >= 0 ? .green : .red)
            }
            .frame(maxHeight: 70)
            .padding()

        }
        
    }
    
    // Format the date that shows below the expense name in the view.
    // Adjust the format below to change how the date and time are shown
    func formatDateForListView() -> String {
        listDateFormatter.dateFormat = "MMM dd 'at' h:mma"
        return listDateFormatter.string(from: expense.date)
    }
    
    // Handle adding a "+" or "-" before the amount in the view as appropriate
    // Is there a better way to do this?
    func generateAmountString() -> String {
        if expense.amount >= 0 {
            return "+ $\(expense.amount)"
        } else {
            return "- $\(expense.amount)"
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    
    static var previews: some View {
        let expense = Expense(amount: 100.00, name: "Test Expense", category: Category(name: "Travel", color: .blue, symbol: .travel), date: Date())
        
        ExpenseView(expense)
    }
}
