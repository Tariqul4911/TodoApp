//
//  Tasks+CoreDataProperties.swift
//  RelationshipCoreData
//
//  Created by Md. Mehedi Hasan Akash on 1/28/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var task: String?
    @NSManaged public var taskName: TaskName?

}
