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

class PMCategory{
    
    static let name = "Category"
    
    static func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
        
    }
    
    static func newCategory(imageName: String, name: String) -> Category{
        let context = getContext()
        
        let category = NSEntityDescription.insertNewObject(forEntityName: name, into: context) as! Category
        
        category.image = imageName
        category.name = name
        category.tasks = NSSet()
        
        return category
    }
    
    static func fetchAllCategory() -> [Category]{
        var categories: [Category] = []
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Category>(entityName: name)
        
        do{
            
            try categories = context.fetch(fetchRequest)
            
        } catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
        
        return categories
        
    }
    
    static func saveContext() {
        let context = getContext()
        
        do{
            
            try context.save()
            
        }catch let error as NSError{
            
            print("Errore in fetch \(error.code)")
            
        }
    }
    
    
    static func deleteCategory(category: Category){
        let context = getContext()
        context.delete(category)
        
        
    }
    
    
//    ADD TASK
}
