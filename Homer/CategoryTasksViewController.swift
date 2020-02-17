//
//  CategoryTasksViewController.swift
//  Homer
//
//  Created by Alfredo Giuliano on 17/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit

class CategoryTasksViewController: UIViewController, UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex==0{
            return NStasks!.count
        }
        else {
            return disabledTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "categoryTasksCell", for: indexPath) as! CategoryTasksCell
        print("row: \(indexPath.row)")
//        print(segmentedControl)
        let task:Task=tasks[indexPath.row]
        cell.descriptionLabel.text=task.desc
        cell.savingsLabel.text="\(task.savings)$"
        cell.ecoPointsLabel.text="\(task.ecoPoints)EP"
        cell.checkBox.isSelected=task.isChecked()
        cell.weeklyLabel.isHidden=(!task.weekly)
        return cell
    }
    

    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var category:String="titolo"
    var tasks: [Task] = []
    var NStasks:NSSet?
    var disabledTasks: [Task]=[]

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            case 0:
                print("Selected 'All'")
                
            case 1:
                print("Selected 'Disabled'")
            default:
                print("Unexpected behaviour")
            }
            
        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title=category

        tableView.delegate = self
        tableView.dataSource = self
        
        NStasks=PMCategory.fetchByName(name: category)[0].tasks!
        tasks = []
        disabledTasks = []

        for object in NStasks! {
             tasks.append(object as! Task)
            if tasks.last?.state=="disabled"{
                disabledTasks.append(object as! Task)
            }
        }

        // Do any additional setup after loading the view.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
