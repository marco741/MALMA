//
//  Goal+CoreDataProperties.swift
//  Homer
//
//  Created by Marco Della Rocca on 09/05/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var below: Bool
    @NSManaged public var category: String?
    @NSManaged public var done: Bool
    @NSManaged public var goal: Int32
    @NSManaged public var achievementName: String?
    @NSManaged public var achievement: Achievement?
    @NSManaged public var task: Task?
    
    func checkDone() -> Bool{
        if(done){
            return true
        }else{
            if(PMGoal.verifyGoal(goal: self)){
                self.done = true
                PMGoal.saveContext()
                return true
            }else{
                return false
            }
        }
    }

}
