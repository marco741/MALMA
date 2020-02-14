//
//  PMUser.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import Foundation
import CoreData

import UIKit

class PMGoal{
    
    static let name = "Goal"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    static func newGoal(task: Task, achivement: Achievement, goalNum: Int) -> Goal{
        let context = getContext()
        
        let goal = NSEntityDescription.insertNewObject(forEntityName: name, into: context) as! Goal
        
        goal.goal =  Int32(goalNum)
        goal.task = task
        goal.achivement = achivement
        
        
        return goal
    }
    
    static func fetchAllGoal() -> [Goal]{
        var goals: [Goal] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: name)
        
        do{
            
            try goals = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return goals
        
    }
    
    static func saveContext() {
        let context = getContext()
        
        do{
            
            try context.save()
            
        }catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
    }
    
    
    static func deleteGoal(goal: Goal){
        let context = getContext()
        context.delete(goal)
        
        
    }
    
    
//    ADD TASK
}
