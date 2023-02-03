//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-02-03.
//

import Foundation

extension Double {
    private static var commaFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    internal var commaRepresentation: String {
        return Double.commaFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
