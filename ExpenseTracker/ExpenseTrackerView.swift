//
//  ExpenseTrackerView.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import SwiftUI

struct ExpenseTrackerView: View {
    @ObservedObject var manager = ExpenseManager()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ExpenseTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackerView()
    }
}
