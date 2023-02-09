//
//  MainViewController.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-09.
//

import SwiftUI

class MainViewController: ObservableObject {
    private(set) var preferences: Preferences
    @ObservedObject var homeViewController: HomeViewController = HomeViewController()
    
    init(preferences: Preferences?) {
        self.preferences = preferences ?? Preferences(accentColor: .indigo)
    }
    
}
