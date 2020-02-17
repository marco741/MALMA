//
//  User+CoreDataProperties.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var totEcoPoints: Int32
    @NSManaged public var totSavings: Float
    
    
    func getEcoPointsOfDay() -> Int32{
        let tasks = PMDoneTask.fetchDoneTaskOfDay()
        
        var ecoPoints:Int32 = 0
        
        for doneTask in tasks{
            ecoPoints += doneTask.task?.ecoPoints ?? 0
        }
        
        return ecoPoints
    }
    
    func getEcoPointsOfMonth() -> Int32{
        let tasks = PMDoneTask.fetchDoneTaskOfMonth()
          
          var ecoPoints:Int32 = 0
          
          for doneTask in tasks{
              ecoPoints += doneTask.task?.ecoPoints ?? 0
          }
          
          return ecoPoints
      }

}
