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

class PMAchievement{
    
    static let tableName = "Achievement"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    @discardableResult
    static func newAchievement(imageName: String, name: String, desc: String) -> Achievement{
        let context = getContext()
        
        let achievement = NSEntityDescription.insertNewObject(forEntityName: tableName, into: context) as! Achievement
        
        achievement.image = imageName
        achievement.name = name
        achievement.desc = desc
        achievement.unlocked = false
        achievement.goals = NSSet()
        
        
        return achievement
    }
    
    static func fetchAllAchievement() -> [Achievement]{
        var achievements: [Achievement] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Achievement>(entityName: tableName)
        
        do{
            
            try achievements = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return achievements
        
    }
    
    static func fetchByName(name: String) -> [Achievement]{
           var achievements: [Achievement] = []
           
           let context = getContext()
           
           let fetchRequest = NSFetchRequest<Achievement>(entityName: tableName)
           fetchRequest.predicate = NSPredicate(format: "name = %@", name)
           
           do{
               
               try achievements = context.fetch(fetchRequest)
               
           } catch let error as NSError{
               
               print("Errore in fetch \(error.code)")
               
           }
           
           return achievements
           
       }
    
    
    
    static func saveContext() {
        let context = getContext()
        
        do{
            
            try context.save()
            
        }catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
    }
    
    
    static func deleteAchievement(achievement: Achievement){
        let context = getContext()
        context.delete(achievement)
        
        
    }
    
    
//    ADD TASK
}
