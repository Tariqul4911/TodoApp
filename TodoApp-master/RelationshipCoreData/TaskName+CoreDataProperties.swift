//
//  TaskName+CoreDataProperties.swift
//  RelationshipCoreData
//
//  Created by Md. Mehedi Hasan Akash on 1/28/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskName {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskName> {
        return NSFetchRequest<TaskName>(entityName: "TaskName")
    }

    @NSManaged public var name: String?
    @NSManaged public var taskList: Tasks?

}
