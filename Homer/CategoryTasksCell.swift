//
//  CategoryTasksCell.swift
//  Homer
//
//  Created by Alfredo Giuliano on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit

class CategoryTasksCell: UITableViewCell {
    @IBOutlet weak var weeklyLabel: RotatedUILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var savingsLabel: UILabel!
    @IBOutlet weak var ecoPointsLabel: UILabel!
    @IBOutlet weak var checkbox: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        weeklyLabel.transform=CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        weeklyLabel.textColor=UIColor.red
        
        checkbox.setImage(UIImage(systemName: "circle"), for: .normal)
        checkbox.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)
        checkbox.isSelected = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if(selected){
            checkbox.isSelected.toggle()
        }
        // Configure the view for the selected state
    }

}
