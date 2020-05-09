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
    
    static let tableName = "Goal"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    @discardableResult
    static func newGoal(category: String, achievement: Achievement, goalNum: Int32, below: Bool) -> Goal{
        let context = getContext()
        
        let goal = NSEntityDescription.insertNewObject(forEntityName: tableName, into: context) as! Goal
        
        goal.achievementName = achievement.name
        goal.goal =  goalNum
        goal.task = nil
        goal.category = category
        goal.below = below
        goal.achievement = achievement
        goal.done = false
        
        
        return goal
    }
    
    
    static func fetchByAchievementName(name: String) -> [Goal]{
        var goals: [Goal] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: tableName)
        fetchRequest.predicate = NSPredicate(format: "achievementName = %@", name)
        
        do{
            
            try goals = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return goals
        
    }
    
    
    static func fetchAllGoal() -> [Goal]{
        var goals: [Goal] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: tableName)
        
        do{
            
            try goals = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return goals
        
    }
    
    static func verifyGoal(goal: Goal) -> Bool{
        
        let category = PMCategory.fetchByName(name: goal.category!)[0]
        
        let tasks = category.tasks
        
        var done = 0
        
        for task in tasks!{
            let t  = task as! Task
            
            if(t.doneNum > 0){
                done += 1
            }
        }
        
        if(done >= goal.goal){
            return true
        }else{
            return false
        }
        
        
        
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
