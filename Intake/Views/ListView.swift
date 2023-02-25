//
//  ListView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/29/22.
//

import SwiftUI


struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        predicate: nil,
        animation: .default)
    private var allItems: FetchedResults<Item>
    
    @State private var searchIntakeTitle = ""
    
    var filteredItems: [Item] {
        
        let allItemsArray = allItems.compactMap{$0}
        
        if searchIntakeTitle.isEmpty {
            return allItemsArray
        } else {
            return allItemsArray.filter { $0.title?.localizedCaseInsensitiveContains(searchIntakeTitle) ?? false }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredItems) { item in
                    
                    NavigationLink {
                        Text(item.timestamp!, formatter: Date.itemFormatter)
                    } label: {
                        HStack {
                            Text("\(item.title ?? "name")")
                            Spacer()
                            Text(String(item.calories))
                                .foregroundColor(.red)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
                
            }
            .navigationTitle("List")
            .searchable(text: $searchIntakeTitle)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { allItems[$0] }.forEach(viewContext.delete)
            
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



