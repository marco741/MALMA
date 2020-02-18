//
//  SummaryViewController.swift
//  Homer
//
//  Created by Marco Mannara on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit
import SceneKit

class SummaryViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let spacing: CGFloat = 12.0
    
    @IBOutlet var piggyBank: UIImageView!
    @IBOutlet var earth: UIImageView!
    @IBOutlet var ecoPointsText: UILabel!
    @IBOutlet var savingsText: UILabel!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var achievements:[Achievement] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath) as! AchievementCell
        
        cell.cellImage.image = achievements[indexPath.row].getIcon()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var ecoPoints:Int32 = 0
        var savings:Float = 0.0
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
             ecoPoints  = PMUser.fetchUser().totEcoPoints
             savings = PMUser.fetchUser().totSavings
        case 1:
             ecoPoints  = PMUser.fetchUser().getEcoPointsOfMonth()
             savings = PMUser.fetchUser().getSavingsOfMonth()
        case 2:
             ecoPoints  = PMUser.fetchUser().getEcoPointsOfDay()
             savings = PMUser.fetchUser().getSavingsOfDay()
        default:
            print("Unexpected behaviour")
        }
        
                   
        savingsText.text = "\(savings)$"
        ecoPointsText.text = "\(ecoPoints)EP"
        
        achievements = PMAchievement.fetchAllAchievement()
        self.achievementCollection.reloadData()
        
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            let ecoPoints  = PMUser.fetchUser().totEcoPoints
            let savings = PMUser.fetchUser().totSavings
            
            savingsText.text = "\(savings)$"
            ecoPointsText.text = "\(ecoPoints)EP"
            
            print("first segment")
            
        case 1:
            let ecoPoints  = PMUser.fetchUser().getEcoPointsOfMonth()
            let savings = PMUser.fetchUser().getSavingsOfMonth()
            
            savingsText.text = "\(savings)$"
            ecoPointsText.text = "\(ecoPoints)EP"
            print("second segment")
        case 2:
            print("third segment")
            let ecoPoints  = PMUser.fetchUser().getEcoPointsOfDay()
            let savings = PMUser.fetchUser().getSavingsOfDay()
                       
            savingsText.text = "\(savings)$"
            ecoPointsText.text = "\(ecoPoints)EP"
            
            
        default:
            print("Unexpected behaviour")
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 4
        let spacingBetweenCells: CGFloat = 9

        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) + 2 * numberOfItemsPerRow

        if let collection = achievementCollection {
            let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: 0, height: 0)
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
