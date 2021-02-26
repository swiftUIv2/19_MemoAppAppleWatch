//
//  PersistantContainer.swift
//  MemoAppAppleWatch WatchKit Extension
//
//  Created by emm on 24/02/2021.
//

import CoreData



struct PersistentController {
    static let shared = PersistentController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name:  "Task")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

