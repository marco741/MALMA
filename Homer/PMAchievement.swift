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
    
    static let name = "Achievement"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    static func newAchievement(imageName: String, name: String) -> Achievement{
        let context = getContext()
        
        let achievement = NSEntityDescription.insertNewObject(forEntityName: name, into: context) as! Achievement
        
        achievement.image = imageName
        achievement.name = name
        achievement.unlocked = false
        achievement.goals = NSSet()
        
        
        return achievement
    }
    
    static func fetchAllAchievement() -> [Achievement]{
        var achievements: [Achievement] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Achievement>(entityName: name)
        
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
