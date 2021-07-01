//
//  ExpensesClass.swift
//  iExpense
//
//  Created by iresh sharma on 02/07/21.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject {
    @Published var items = Array<ExpenseItem>() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try?
                encoder.encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "items")
                }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

