//
//  ContentView.swift
//  iExpense
//
//  Created by iresh sharma on 30/06/21.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(item.type.lowercased() == "food" ? Color.green.opacity(0.3) : Color.red.opacity(0.3))
                                Text(item.type)
                                    .foregroundColor(item.type.lowercased() == "food" ? Color.green : Color.red)
                            }
                            .padding(.horizontal)
                            .frame(width: 100)
                            Text("$\(item.amount, specifier: "%.2f")")
                                .foregroundColor(item.type == "food" ? Color.green : Color.red)
                                .fontWeight(.black)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        expenses.items.remove(atOffsets: indexSet)
                    })
                }
                Button(action: {
                    self.showSheet.toggle()
                }, label: {
                    Text("Add Expense")
                })
            }
            .sheet(isPresented: $showSheet, content: {
                AddExpense(expenses: self.expenses)
            })
            .navigationTitle("iExpense")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
