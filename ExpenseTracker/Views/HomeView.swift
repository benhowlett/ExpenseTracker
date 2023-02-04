//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var manager: ExpenseManager = ExpenseManager()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            
            // Background
            VStack {
                Color(.systemIndigo)
                    .ignoresSafeArea(.all)
                    .frame(height: 300)
                Spacer()
            }
            
            // Content
            VStack {
                
                // Header content
                VStack {
                    Text("Current Balance")
                        .textCase(.uppercase)
                        .font(.subheadline)
                        .padding([.bottom], 1)
                    Text("$" + manager.getCurrentBalance().commaRepresentation)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding([.bottom], 1)
                    Text(manager.getLatestEntryMonth())
                        .font(.subheadline)
                    HStack {
                        VStack{
                            HStack {
                                Image(systemName: "arrow.up.circle.fill")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.background, .green)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                                    .font(.title3)
                                Text("Income")
                                    .textCase(.uppercase)
                            }
                            .font(.subheadline)
                            Text("$" + manager.getIncome().commaRepresentation)
                                .padding([.top], 2)
                        }
                        .padding()
                        Spacer()
                        VStack{
                            HStack {
                                Image(systemName: "arrow.down.circle.fill")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.background, .red)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                                    .font(.title3)
                                Text("Expense")
                                    .textCase(.uppercase)
                            }
                            .font(.subheadline)
                            
                            Text("$" + manager.getExpense().commaRepresentation)
                                .padding([.top], 2)
                        }
                        .padding()
                    }
                    .padding()
                }
                .padding([.leading, .trailing])
                .foregroundColor(colorScheme == .light ? .black : .white)
                
                // Expense content
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
    }
}

struct ExpenseTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        let manager: ExpenseManager = ExpenseManager()
        manager.addExpense(Expense(amount: 100.00, name: "Test Expense 1", category: Category(name: "Travel", color: .blue, symbol: .airplane), date: Date()))
        manager.addExpense(Expense(amount: -123.45, name: "Test Expense 2", category: Category(name: "Groceries", color: .green, symbol: .carrot), date: Date()))
        manager.addExpense(Expense(amount: 17.76, name: "Test Expense 3", category: Category(name: "Fuel", color: .orange, symbol: .fuel), date: Date()))
        manager.addExpense(Expense(amount: 2023.99, name: "Long Test Expense 4", category: Category(name: "Takeout", color: .mint, symbol: .takeout), date: Date()))
        manager.addExpense(Expense(amount: 0, name: "Long Test Expense 5", category: Category(name: "Housing", color: .red, symbol: .house), date: Date()))
        manager.addExpense(Expense(amount: -450.00, name: "Long Test Expense 6", category: Category(name: "Entertainment", color: .cyan, symbol: .theater), date: Date()))
        return HomeView(manager: manager)
    }
}
