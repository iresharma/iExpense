//
//  ExpenseItemModel.swift
//  iExpense
//
//  Created by iresh sharma on 02/07/21.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let name: String
    let type: String
    let amount: Double
    let id = UUID()
}
