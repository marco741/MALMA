//
//  SummaryViewController.swift
//  Homer
//
//  Created by Marco Mannara on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var piggyBank: UIImageView!
    
    @IBOutlet var earth: UIImageView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath)
        
        return cell
    }
    

    
    @IBOutlet var achievementCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementCollection.delegate = self
        achievementCollection.dataSource = self
        
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
