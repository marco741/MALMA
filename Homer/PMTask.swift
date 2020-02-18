//
//  PMUser.swift
//  Homer
//
//  Created by Lorenzo Fasolino on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import CoreData
import Foundation

import UIKit

class PMTask {
    static let tableName = "Task"

    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.persistentContainer.viewContext
    }

    static func newTask(id: Int32, desc: String, ecoPoint: Int32, savings: Float, state: String, weekly: Bool, categoty: Category) -> Task {
        let context = getContext()

        let task = NSEntityDescription.insertNewObject(forEntityName: tableName, into: context) as! Task

        task.id = id
        task.desc = desc
        task.doneNum = 0
        task.ecoPoints = ecoPoint
        task.savings = savings
        task.state = state
        task.weekly = weekly
        task.category = categoty
        task.priority = 0

        task.goals = NSSet()

        return task
    }

    static func fetchAllTask() -> [Task] {
        var task: [Task] = []

        let context = getContext()

        let fetchRequest = NSFetchRequest<Task>(entityName: tableName)

        do {
            try task = context.fetch(fetchRequest)

        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }

        return task
    }

    static func fetchUnselectedTask(_ withPriority: Bool = false) -> [Task] {
        var tasks: [Task] = []

        let context = getContext()

        let fetchRequest = NSFetchRequest<Task>(entityName: tableName)
        fetchRequest.predicate = NSPredicate(format: "state = 'enabled'")

        do {
            try tasks = context.fetch(fetchRequest)

        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }

        let tasks2 = tasks.filter { !$0.isChecked() }
        if(withPriority){
            return orderWithRandomPriorityPoll(tasks2)
        }
        return tasks2
    }

    static func fetchById(id: Int32) -> [Task] {
        var task: [Task] = []

        let context = getContext()

        let fetchRequest = NSFetchRequest<Task>(entityName: tableName)
        fetchRequest.predicate = NSPredicate(format: "id = %i", id)

        do {
            try task = context.fetch(fetchRequest)

        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }

        return task
    }

    static func saveContext() {
        let context = getContext()

        do {
            try context.save()

        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
    }

    static func deleteTask(task: Task) {
        let context = getContext()
        context.delete(task)
    }
}
