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
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack {
                        NavigationLink {
                            Text(item.timestamp!, formatter: itemFormatter)
                        } label: {
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
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    EditButton()
            //                }
            //                ToolbarItem {
            //                    Button(action: addItem) {
            //                        Label("Add Item", systemImage: "plus")
            //                    }
            //                }
            //            }
        }
    }
        
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
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


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
