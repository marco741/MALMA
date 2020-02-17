//
//  Goal+CoreDataProperties.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 16/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var goal: Int32
    @NSManaged public var below: Bool
    @NSManaged public var achivement: Achievement?
    @NSManaged public var task: Task?

}
