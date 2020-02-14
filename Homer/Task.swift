//
//  Task.swift
//  Homer
//
//  Created by Marco Mannara on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import Foundation

struct Task {
    let savings : Float
    let description : String
    let ecoPoints : Int
    let category : TaskCategory
}

enum TaskCategory : Int{
    case CIBO
    case ACQUA
    case ENERGIA
    case RIFIUTI
    case TRASPORTI
}
