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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "categoryTasksCell", for: indexPath)
        return cell
    }
    

    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    
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
        self.navigationItem.title="titolo"

        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
//    ovveride func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
