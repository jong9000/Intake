//
//  Item+FetchRequests.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/30/22.
//

import CoreData

extension Item {
    static var fetchLastItem: NSFetchRequest<Item> {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.fetchLimit = 1
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)]
        return request
    }
}
