//
//  Populator.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import Foundation

class Populator{
    
    static func populateDB(){
        
        _ = PMUser.newUser()
        
        
        let categories = jsonRead(fileName: "categories")
        
//        print(categories[0]["name"]!)
        
        for category in categories{
           _ = PMCategory.newCategory(imageName: category["image"] as! String, name: category["name"] as! String)
        }
        
        
        let tasks = jsonRead(fileName: "task")
        
        for task in tasks{
            
            print("category = \(task["category"] as! String)")
            
            let category = PMCategory.fetchByName(name: task["category"] as! String)
            
                let id = Int32(task["id"] as! String)
                let desc = task["desc"] as! String
                let ecoP = Int32(task["ecoPoints"] as! String)
                let savings = Float(task["savings"] as! String)
                let weekly = Bool(task["weekly"] as! String)
                
                
                let t =  PMTask.newTask(id: id!,desc: desc, ecoPoint: ecoP!, savings: savings!, state: "enabled", weekly: weekly!, categoty: category[0])
                
                category[0].addTask(task: t)
        
            
            
        }
        
        let achievements = jsonRead(fileName: "achievement")
        
        for achievement in achievements{
            
            let image = achievement["image"] as! String
            let name = achievement["name"] as! String
            let desc = achievement["desc"] as! String
            
            _ = PMAchievement.newAchievement(imageName: image, name: name, desc: desc)
            
            
            
        }
        
        let goals = jsonRead(fileName: "goal")
        
        for goal in goals{
            
            let taskId = Int32(goal["task"] as! String)
            let achievementName = goal["achievement"] as! String
            
            let achievement = PMAchievement.fetchByName(name: achievementName)
            let task = PMTask.fetchById(id: taskId!)
            
            let goalNum = Int32(goal["goal"] as! String)
            let below = Bool(goal["below"] as! String)
            
            _ = PMGoal.newGoal(task: task[0], achivement: achievement[0], goalNum: goalNum!, below: below!)
            
            
        }
        
        
        
        
        
        PMTask.saveContext()
        
        
    }
    
    
    
    
    
    static func jsonRead(fileName: String)-> [[String: Any]]{
        
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
        var json:[[String: Any]] = [["":""]]
        do {
            let jsonData = try Data(contentsOf: url)
             json = try JSONSerialization.jsonObject(with: jsonData) as! [[String: Any]]
          
          
        }
        catch {
            print(error)
        }
        
        return json
    }
    
    
    
    
    
    
    
    
    
}
