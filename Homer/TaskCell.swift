//
//  TaskCell.swift
//  Homer
//
//  Created by Marco Mannara on 13/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    

    
    @IBOutlet var CategoryIcon: UIImageView!
    @IBOutlet var EcoPointsText: UILabel!
    @IBOutlet var SavingsText: UILabel!
    @IBOutlet var DescriptionText: UILabel!
    @IBOutlet var CheckButton: UIButton!
    
    /*
    @IBAction func checkPressed(_ sender: UIButton) {
        CheckButton.isSelected.toggle()
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CheckButton.setImage(UIImage(systemName: "circle"), for: .normal)
        CheckButton.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)
            
        CheckButton.isSelected = false
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        if(selected){
            CheckButton.isSelected.toggle()
        }
    }
    
    
}
