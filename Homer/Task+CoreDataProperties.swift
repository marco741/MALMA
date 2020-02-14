//
//  Task+CoreDataProperties.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var desc: String?
    @NSManaged public var doneNum: Int32
    @NSManaged public var ecoPoints: Int32
    @NSManaged public var savings: Float
    @NSManaged public var state: String?
    @NSManaged public var weekly: Bool
    @NSManaged public var category: Category?
    @NSManaged public var goals: NSSet?
    
    
    func getIcon(_ desaturated: Bool) -> UIImage?{
        var iconName = category.image
        if(desaturated){
            return UIImage(named:iconName+"_desaturated")
        }
        else{
            return UIImage(named:iconName)
        }
    }
    
    

}

// MARK: Generated accessors for goals
extension Task {

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: Goal)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: Goal)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSSet)

}
