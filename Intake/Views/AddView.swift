//
//  AddView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/30/22.
//

import SwiftUI

struct AddView: View {
    
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
            }
            .navigationTitle("Add")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
