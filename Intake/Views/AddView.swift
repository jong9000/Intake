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
    @State private var servings = ""
    
    @State private var userInput = ""
    @State private var userNumber = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                }
                Section {
                    TextField("Servings", text: $servings)
                        .keyboardType(.decimalPad)
                    TextField("Calories", text: $calories)
                        .keyboardType(.decimalPad)
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
