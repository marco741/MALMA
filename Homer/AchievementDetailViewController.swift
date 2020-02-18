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
    @IBOutlet var achievementDesc: UILabel!
    
    var achievement : Achievement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = SCNScene(named:"cube.scn")
        
       if let ach = achievement {
        
        navigationItem.title = ach.name
        achievementDesc.text = ach.desc
        
        }
        
        detailSceneView.allowsCameraControl = true
        detailSceneView.showsStatistics = false
        detailSceneView.cameraControlConfiguration.allowsTranslation = false
        detailSceneView.scene = scene
        navigationController?.navigationBar.tintColor = UIColor(red: 18 / 255, green: 148 / 255, blue: 148 / 255, alpha: 1.0)
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
