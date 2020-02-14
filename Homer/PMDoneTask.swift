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

class PMDoneTask{
    
    static let tableName = "DoneTask"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    static func newDoneTask(task: Task) -> DoneTask{
        let context = getContext()
        
        let doneTask = NSEntityDescription.insertNewObject(forEntityName: tableName, into: context) as! DoneTask
        
        doneTask.doneDate = Date()
        doneTask.task = task
        return doneTask
    }
    
    static func fetchAllDoneTask() -> [DoneTask]{
        var doneTasks: [DoneTask] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<DoneTask>(entityName: tableName)
        
        do{
            
            try doneTasks = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return doneTasks
        
    }
    
   /* static func fetchAllDoneTaskOfDay() -> [DoneTask]{
        var doneTasks: [DoneTask] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<DoneTask>(entityName: name)
        
        do{
            
            try doneTasks = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return doneTasks
        
    }*/
    
    static func saveContext() {
        let context = getContext()
        
        do{
            
            try context.save()
            
        }catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
    }
    
    
    static func deleteUser(doneTask: DoneTask){
        let context = getContext()
        context.delete(doneTask)
        
        
    }
    
}
