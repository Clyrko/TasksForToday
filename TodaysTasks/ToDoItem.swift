//
//  ToDoItem.swift
//  TodaysTasks
//
//  Created by Jay A. on 3/2/20.
//  Copyright © 2020 Jay A. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

 
