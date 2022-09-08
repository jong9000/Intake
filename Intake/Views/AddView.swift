//
//  AddView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/30/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var calories = ""
    @State private var servings: Int = 1
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                }
                Section {
                    Stepper("Servings: \(servings)", value: $servings, in: 0...100)
                    TextField("Calories per serving", text: $calories)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Text("Total calories: \(servings * (Int(calories) ?? 0))")
                }
                HStack {
                    Spacer()
                    Button("Submit") {
                        addItem()
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }

            }
            .navigationTitle("Add")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.calories = Int16(servings * (Int(calories) ?? 0))
            newItem.title = name
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
