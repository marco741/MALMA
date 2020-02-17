//
//  SummaryViewController.swift
//  Homer
//
//  Created by Marco Mannara on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit
import SceneKit

class SummaryViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var piggyBank: UIImageView!
    @IBOutlet var earth: UIImageView!
    @IBOutlet var ecoPointsText: UILabel!
    @IBOutlet var savingsText: UILabel!
    
    
    var achievements:[Achievement] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath) as! AchievementCell
        
        cell.cellImage.image = UIImage(named: achievements[indexPath.row].image!)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    @IBOutlet var achievementCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementCollection.delegate = self
        achievementCollection.dataSource = self
        
        achievements = PMAchievement.fetchAllAchievement()
        
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            print("first segment")
        case 1:
            print("second segment")
        case 2:
            print("third segment")
        default:
            print("Unexpected behaviour")
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "achievementDetail"{
            let detail = segue.destination as! AchievementDetailViewController
            let index = achievementCollection.indexPathsForSelectedItems?[0].row
            
            if let selectedIndex = index {
                detail.achievement = achievements[selectedIndex]
            }
        }
    }
}
