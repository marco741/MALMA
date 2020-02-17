//
//  AchievementDetailViewController.swift
//  Homer
//
//  Created by Marco Mannara on 15/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit
import SceneKit

class AchievementDetailViewController: UIViewController {

    @IBOutlet var detailSceneView: SCNView!
    @IBOutlet var achievementTitle: UILabel!
    @IBOutlet var achievementDesc: UILabel!
    
    var achievement : Achievement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ach = achievement {
            achievementTitle.text = ach.name
            achievementDesc.text = ach.desc
        }
        
        let scene = SCNScene(named:"water_medal_bronze.scn")
        
        detailSceneView.allowsCameraControl = true
        detailSceneView.showsStatistics = false
        detailSceneView.cameraControlConfiguration.allowsTranslation = false
        detailSceneView.scene = scene
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
