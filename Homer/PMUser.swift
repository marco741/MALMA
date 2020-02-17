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

class PMUser{
    
    static let tableName = "User"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    static func newUser() -> User{
        let context = getContext()
        
        let user = NSEntityDescription.insertNewObject(forEntityName: tableName, into: context) as! User
        
        user.totEcoPoints = 0
        user.totSavings = 0
        
        return user
    }
    
    static func fetchAllUsers() -> [User]{
        var users: [User] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<User>(entityName: tableName)
        
        do{
            
            try users = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return users
        
    }
    
    static func fetchUser() -> User{
        var users: [User] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<User>(entityName: tableName)
        
        do{
            
            try users = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return users[0]
        
    }
    
    
    static func saveContext() {
        let context = getContext()
        
        do{
            
            try context.save()
            
        }catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
    }
    
    
    static func deleteUser(user: User){
        let context = getContext()
        context.delete(user)
        
        
    }
    
}
