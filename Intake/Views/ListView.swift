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
                predicate: NSPredicate(format: "timestamp > %@", UserCalendar().startOfDay as NSDate),
                  animation: .default)
    private var todaysItems: FetchedResults<Item>
    
    @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
                predicate: NSPredicate(format: "timestamp >= %@ && timestamp < %@", UserCalendar().startOfYesterday as NSDate, UserCalendar().startOfDay as NSDate),
                  animation: .default)
    private var yesterdaysItems: FetchedResults<Item>
    
    @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
                predicate: NSPredicate(format: "timestamp < %@", UserCalendar().startOfYesterday as NSDate),
                  animation: .default)
    private var previousItems: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(todaysItems) { item in
                        
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

                } header: {
                    Text("Today")
                }
                
                Section {
                    ForEach(yesterdaysItems) { item in
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
                } header: {
                    Text("Yesterday")
                }
                
                Section {
                    ForEach(previousItems) { item in
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
                } header: {
                    Text("Previous")
                }
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
            offsets.map { todaysItems[$0] }.forEach(viewContext.delete)
            
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



