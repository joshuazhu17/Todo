//
//  CoreDataHelper.swift
//  Todo
//
//  Created by Cappillen on 7/6/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
        
    }()
    
    static func newTodo() -> Todo {
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context) as! Todo
        
        return todo
    }
}
