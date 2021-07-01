//
//  addScreen.swift
//  iExpense
//
//  Created by iresh sharma on 02/07/21.
//

import SwiftUI

struct AddExpense: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Name", text: $name)
                    TextField("Enter Type", text: $type)
                    TextField("Enter Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarItems(trailing: Button("Save", action: add))
        }
    }
    
    func add() {
        let newExpense = ExpenseItem(name: name, type: type, amount: Double(amount) ?? 0)
        self.expenses.items.append(newExpense)
        self.presentationMode.wrappedValue.dismiss()
    }
}


struct addScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense(expenses: Expenses())
    }
}
