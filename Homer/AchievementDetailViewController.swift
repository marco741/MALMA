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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            /*
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 10, 10)
        scene?.rootNode.addChildNode(cameraNode)
            
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene?.rootNode.addChildNode(lightNode)
           
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        */
        
        let scene = SCNScene(named:"cube.scn")
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
