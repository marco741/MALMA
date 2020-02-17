//
//  CategoryTasksCell.swift
//  Homer
//
//  Created by Alfredo Giuliano on 17/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit

class CategoryTasksCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weeklyLabel: UILabel!
    @IBOutlet weak var savingsLabel: UILabel!
    @IBOutlet weak var ecoPointsLabel: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var checked = false

    var task: Task? {
        willSet{
            if let cellTask = newValue{
                print("checked\(cellTask.isChecked())")
               if(cellTask.isChecked()){
                   checkBox.isSelected = true
                   checked = true
               }else{
                   checkBox.isSelected = false
                   checked = false
               }
                weeklyLabel.isHidden=(!cellTask.weekly)
                print("weekly: \(cellTask.weekly)")
                
               ecoPointsLabel.text = String(cellTask.ecoPoints) + "EP"
               savingsLabel.text = String(cellTask.savings) + "$"
               descriptionLabel.text = cellTask.desc
           }
       }
        
    }

}
