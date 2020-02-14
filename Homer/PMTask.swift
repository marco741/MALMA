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

class PMTask{
    
    static let tableName = "Task"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    static func newTask(desc: String, ecoPoint: Int32, savings: Float, state:String, weekly: Bool, categoty: Category) -> Task{
        let context = getContext()
        
        let task = NSEntityDescription.insertNewObject(forEntityName: tableName, into: context) as! Task
        
        task.desc = desc
        task.doneNum = 0
        task.ecoPoints = ecoPoint
        task.savings = savings
        task.state = state
        task.weekly = weekly
        task.category = categoty
        task.goals = NSSet()
        
        
        return task
    }
    
    static func fetchAllTask() -> [Task]{
        var task: [Task] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Task>(entityName: tableName)
        
        do{
            
            try task = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return task
        
    }
    
    static func saveContext() {
        let context = getContext()
        
        do{
            
            try context.save()
            
        }catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
    }
    
    
    static func deleteTask(task: Task){
        let context = getContext()
        context.delete(task)
        
        
    }
    
    
}
