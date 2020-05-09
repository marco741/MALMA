//
//  Populator.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import Foundation

class Populator {
    static func populateDB() {
        // @discardableResult
        let last_fetch = UserDefaults.standard.double(forKey: "last_fetch")
        print("prima:", last_fetch)

        if PMUser.fetchAllUsers().isEmpty {
            print("Creating User")
            PMUser.newUser()
        }

        Updater.get(last_fetch) { update in
            guard let update = update else { return }
            print("Update successfully retrieved")

            let last_fetch = update["last_fetch"] as! Double
            let tasks = update["tasks"] as! [String: [[String: Any]]]
            let achievements = update["achievements"] as! [String: [[String: Any]]]
            let categories = update["categories"] as! [String: [[String: Any]]]

            /* The correct operation order is:
             delete task
             delete achievements
             delete categories
             update categories
             add categories
             update achievements
             add achievements
             update tasks
             add tasks
             */

            print("Deleting old Items")

            // MARK: Delete Tasks

            let deletedTasks = tasks["deleted"]!
            for task in deletedTasks {
                let id = task["id"] as! Int32
                PMTask.deleteTask(task: PMTask.fetchById(id: id)[0])
            }

            // MARK: Delete Achievements

            let deletedAchievements = achievements["deleted"]!
            for achievement in deletedAchievements {
                let name = achievement["name"] as! String
                PMAchievement.deleteAchievement(achievement: PMAchievement.fetchByName(name: name)[0])
                PMGoal.deleteGoal(goal: PMGoal.fetchByAchievementName(name: name)[0])
            }

            // MARK: Delete Categories

            let deletedCategories = categories["deleted"]!
            for category in deletedCategories {
                let name = category["name"] as! String
                PMCategory.deleteCategory(category: PMCategory.fetchByName(name: name)[0])
            }

            print("Updating new Items")

            // MARK: Update Categories

            let updatedCategories = categories["updated"]!
            for category in updatedCategories {
                let name = category["name"] as! String
                PMCategory.deleteCategory(category: PMCategory.fetchByName(name: name)[0])
                PMCategory.newCategory(imageName: category["image"] as! String, name: category["name"] as! String)
            }
            
            // MARK: Create Categories

            let newCategories = categories["new"]!
            for category in newCategories {
                PMCategory.newCategory(imageName: category["image"] as! String, name: category["name"] as! String)
            }
            
            // MARK: Update Achievements
            
            let updatedAchievements = achievements["updated"]!
            for achievement in updatedAchievements {
                let name = achievement["name"] as! String
                PMGoal.deleteGoal(goal: PMGoal.fetchByAchievementName(name: name)[0])
                PMAchievement.deleteAchievement(achievement: PMAchievement.fetchByName(name: name)[0])

                let image = achievement["image"] as! String
                let desc = achievement["desc"] as! String
                let newAchievement = PMAchievement.newAchievement(imageName: image, name: name, desc: desc)

                let category = achievement["category"] as! String
                let goalNum = achievement["goal"] as! Int32
                let below = achievement["below"] as! Bool
                PMGoal.newGoal(category: category, achievement: newAchievement, goalNum: goalNum, below: below)
            }
            
            // MARK: Create Achievements

            let newAchievements = achievements["new"]!
            for achievement in newAchievements {
                let name = achievement["name"] as! String
                let image = achievement["image"] as! String
                let desc = achievement["desc"] as! String
                let newAchievement = PMAchievement.newAchievement(imageName: image, name: name, desc: desc)

                let category = achievement["category"] as! String
                let goalNum = achievement["goal"] as! Int32
                let below = achievement["below"] as! Bool
                PMGoal.newGoal(category: category, achievement: newAchievement, goalNum: goalNum, below: below)
            }
            
            // MARK: Update Tasks

            let updatedTasks = tasks["updated"]!
            for task in updatedTasks {
                let id = task["id"] as! Int32
                let oldTask = PMTask.fetchById(id: id)[0]
                let relativeCategory = oldTask.category!

                relativeCategory.removeFromTasks(oldTask)
                PMTask.deleteTask(task: oldTask)

                let newCategory = PMCategory.fetchByName(name: task["category"] as! String)[0]
                let desc = task["desc"] as! String
                let ecoP = task["ecoPoints"] as! Int32
                let savings = Float(task["savings"] as! String)!
                let weekly = task["weekly"] as! Bool

                let newTask = PMTask.newTask(id: id, desc: desc, ecoPoint: ecoP, savings: savings, state: "enabled", weekly: weekly, category: newCategory)
                newCategory.addTask(task: newTask)
            }
            
            // MARK: Create Tasks

            let newTasks = tasks["new"]!
            for task in newTasks {
                let id = task["id"] as! Int32
                let newCategory = PMCategory.fetchByName(name: task["category"] as! String)[0]
                let desc = task["desc"] as! String
                let ecoP = task["ecoPoints"] as! Int32
                let savings = Float(task["savings"] as! String)!
                let weekly = task["weekly"] as! Bool
                let newTask = PMTask.newTask(id: id, desc: desc, ecoPoint: ecoP, savings: savings, state: "enabled", weekly: weekly, category: newCategory)
                newCategory.addTask(task: newTask)
            }
            
            PMTask.saveContext()
            print("Context successfully saved")

            print("last_fetch:", last_fetch)
            UserDefaults.standard.set(last_fetch, forKey: "last_fetch")
        }
    }
}
