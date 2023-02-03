//
//  MainView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                CategoryView()
                    .tabItem {
                        Label("Category", systemImage: "square.grid.2x2")
                    }
                Spacer()
                ChartView()
                    .tabItem {
                        Label("Chart", systemImage: "chart.pie")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .accentColor(.indigo)
            VStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus.app.fill")
                        .font(.custom("Button", size: 64))
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
        
        MainView()
            .environmentObject(ExpenseManager())
    }
}
