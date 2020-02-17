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
            return NStasks!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "categoryTasksCell", for: indexPath) as! CategoryTasksCell
        print("row: \(indexPath.row)")
        let task:Task
        task=tasks[indexPath.row]
        cell.descriptionLabel.text=task.desc
        cell.savingsLabel.text="\(task.savings)$"
        cell.ecoPointsLabel.text="\(task.ecoPoints)EP"
        cell.checkBox.isSelected=task.isChecked()
        cell.weeklyLabel.isHidden=(!task.weekly)
        cell.enableButton.isHidden=true
        if task.state=="disabled"{
            switchState(cell)
        }
        return cell
    }
    

    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    

    
    var segment: UISegmentedControl?
    var category:String="titolo"
    var tasks: [Task] = []
    var NStasks:NSSet?
    var disabledTasks: [Task]=[]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let header  = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 5, width: header.frame.width-10, height: header.frame.height-10)
        label.text = category
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        header.addSubview(label)
        tableView.tableHeaderView = header
        
        
        segment = UISegmentedControl(items: ["All", "Disabled"])
        segment!.sizeToFit()
        segment!.tintColor = UIColor(red:0.99, green:0.00, blue:0.25, alpha:1.00)
        segment!.selectedSegmentIndex = 0;
        segment!.addTarget(self, action: Selector("segmentValueChanged"), for: .valueChanged)
        
        
        self.navigationItem.titleView = segment
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
    
    private func switchState(_ cell:CategoryTasksCell){
        print("switch!")
        cell.checkBox.isHidden=(!cell.checkBox.isHidden)
        cell.enableButton.isHidden=(!cell.enableButton.isHidden)
        
    }
    
    @IBAction func segmentValueChanged(){
        switch segment!.selectedSegmentIndex{
        case 0: print("0")
        case 1:print("1")
        default: print("Error in switch")
        }
        
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
