//
//  Achievement+CoreDataProperties.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension Achievement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var unlocked: Bool
    @NSManaged public var desc: String?
    @NSManaged public var goals: NSSet?
    
    func getIcon() -> UIImage?{
        let iconName = self.image
        if(!self.unlocked){
            return UIImage(named: iconName!+"_desaturated")
        }
        else{
            return UIImage(named: iconName!)
        }
    }
    
    func checkDone() -> Bool{
        
        if(self.unlocked){
            return true
        }
        
        
        for goal in goals!{
           let g = goal as! Goal
            if(!g.checkDone()){
                return false
            }
            
        }
        
        self.unlocked = true
        PMAchievement.saveContext()
        
        return true
        
    }

}

// MARK: Generated accessors for goals
extension Achievement {

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: Goal)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: Goal)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSSet)

}
