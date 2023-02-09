//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Ben Howlett on 2023-01-29.
//

import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    var amount: Double
    var name: String
    var description: String?
    var category: Category
    var date: Date
}

// All possible expense or income categories should be defined here.
//
// TODO: Add all initial category symbols
// TODO: (Stretch Goal) Add ability for user to create new categories using whatever SF Symbol they want
struct Category: Equatable {
    let id = UUID()
    let name: String
    let color: Color
    let symbol: Symbol
    
    enum Symbol: String {
        case airplane = "airplane"
        case carrot = "carrot"
        case fuel = "fuelpump"
        case takeout = "takeoutbag.and.cup.and.straw"
        case restaurant = "fork.knife"
        case theater = "theatermasks"
        case house = "house"
        case clothing = "tshirt"
        case dollar = "dollarsign"
        case paw = "pawprint"
        case fish = "fish"
        case football = "football"
        case soccer = "soccerball"
        case baseball = "baseball"
        case basketball = "basketball"
        case tennis = "tennisball"
        case volleyball = "volleyball"
        case cricket = "cricket.ball"
        case balloons = "balloon.2"
        case gamecontroller = "gamecontroller"
        case crossedflags = "flag.checkered.2.crossed"
        case camera = "camera"
        case car = "car"
        case bus = "bus"
        case train = "tram"
        case bicycle = "bicycle"
        case bag = "bag"
        case pill = "pill"
        case medicalcross = "cross"
        case syringe = "syringe"
    }
}
