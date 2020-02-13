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
    @IBOutlet var DescriptionText: UITextField!
    @IBOutlet var EcoPointsText: UILabel!
    @IBOutlet var SavingsText: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
