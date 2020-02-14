//
//  Task.swift
//  Homer
//
//  Created by Marco Mannara on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import Foundation
import UIKit

class TaskMock {
    let savings : Float
    let description : String
    let ecoPoints : Int
    let category : TaskCategory
    
    init(_ category : TaskCategory, _ description: String, _ ecoPoints: Int, _ savings: Float){
        self.category = category
        self.description = description
        self.ecoPoints = ecoPoints
        self.savings = savings
    }
    
    func getIcon() -> UIImage?{
        let iconName = category.rawValue;
        return UIImage(named:iconName)
    }
    
    func getIcon(_ desaturated: Bool) -> UIImage?{
        var iconName : String
        if(desaturated){
            iconName = category.rawValue
        }
        else{
            iconName = category.rawValue + "_desaturated";
        }
       
       return UIImage(named:iconName)
    }
}

enum TaskCategory : String{
    case CIBO = "food"
    case ACQUA = "water"
    case ENERGIA = "energy"
    case RIFIUTI = "garbage"
    case TRASPORTI = "transport"
}
