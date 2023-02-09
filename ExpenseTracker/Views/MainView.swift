//
//  MainView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 1
    @ObservedObject var mainViewController: MainViewController = MainViewController(preferences: nil)
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView(homeViewController: mainViewController.homeViewController)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
                CategoryView()
                    .tabItem {
                        Label("Category", systemImage: "square.grid.2x2")
                    }
                    .tag(2)
                Spacer()
                ChartView()
                    .tabItem {
                        Label("Chart", systemImage: "chart.pie")
                    }
                    .tag(3)
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(4)
            }
            .accentColor(.indigo)
//            .onChange(of: selectedTab) {value in
//                print("selected tab = \(value)")
//            }
            VStack {
                Spacer()
                Button(action: {
                    print("Selected tab = \(selectedTab)")
                }, label: {
                    Image(systemName: "plus.app.fill")
                        .font(.custom("Button", size: 60))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.indigo, .indigo.opacity(0.5))
                        .padding([.bottom], -10)
                })
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewController: MainViewController = MainViewController(preferences: nil)
        
        mainViewController.homeViewController.addExpense(Expense(amount: 100.00, name: "Test Expense 1", category: Category(name: "Travel", color: .blue, symbol: .airplane), date: Date()))
        mainViewController.homeViewController.addExpense(Expense(amount: -123.45, name: "Test Expense 2", category: Category(name: "Groceries", color: .green, symbol: .carrot), date: Date()))
        mainViewController.homeViewController.addExpense(Expense(amount: 17.76, name: "Test Expense 3", category: Category(name: "Fuel", color: .orange, symbol: .fuel), date: Date()))
        mainViewController.homeViewController.addExpense(Expense(amount: 2023.99, name: "Long Test Expense 4", category: Category(name: "Takeout", color: .mint, symbol: .takeout), date: Date()))
        mainViewController.homeViewController.addExpense(Expense(amount: 0, name: "Long Test Expense 5", category: Category(name: "Housing", color: .red, symbol: .house), date: Date()))
        mainViewController.homeViewController.addExpense(Expense(amount: -450.00, name: "Long Test Expense 6", category: Category(name: "Entertainment", color: .cyan, symbol: .theater), date: Date()))
        
        return MainView(mainViewController: mainViewController)
    }
}
