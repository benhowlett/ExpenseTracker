//
//  MainView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
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
            .onChange(of: selectedTab) {value in
                print("selected tab = \(value)")
            }
            VStack {
                Spacer()
                Button(action: {
                    print("Button tapped")
                    if selectedTab == 1 {
                        print("selected tab 1")
                    }
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
