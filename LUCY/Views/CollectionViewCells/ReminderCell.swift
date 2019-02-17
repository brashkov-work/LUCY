//
//  ReminderCell.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit
import SnapKit

class ReminderCell: UICollectionViewCell {
    
    @IBOutlet weak var sicknessTitle: UILabel!
    
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var reminderCollectionView: UICollectionView!
    fileprivate let pillCellIdentifier = "pillCell"
    
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var eventCollectionView: UICollectionView!
    fileprivate var eventCellIdentifier = "eventCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initPillCollectionView()
        initEventCollectionView()
        
        sicknessTitle.addBottomBorderWithColor(color:UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.0), width: 1.0)
        sicknessTitle.layer.cornerRadius = 10.0
    }
    
    fileprivate func initPillCollectionView() {
        reminderCollectionView.register(UINib(nibName: "PillCollectioViewCell", bundle: nil), forCellWithReuseIdentifier: pillCellIdentifier)
        
        reminderCollectionView.delegate = self
        reminderCollectionView.dataSource = self
    }
    
    fileprivate func initEventCollectionView() {
        eventCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: eventCellIdentifier)
        
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
    }
}

extension ReminderCell: UICollectionViewDelegate {
    
}

extension ReminderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == reminderCollectionView {
            return 2
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == reminderCollectionView {
            let cell = reminderCollectionView.dequeueReusableCell(withReuseIdentifier: pillCellIdentifier, for: indexPath)
            
            guard let pillCell = cell as? PillCollectioViewCell else {
                return cell
            }
            
            pillCell.pillName.text = "Ibuprofen"
            let image: UIImage?
            let textStatus: String?
            if indexPath.item == 0 {
                image = UIImage(imageLiteralResourceName: "checked")
                textStatus = "Taken"
            } else {
               image = UIImage(imageLiteralResourceName: "upcoming_pill")
                textStatus = "10:30"
            }
            pillCell.reminderStatus.image = image
            pillCell.statusLabel.text = textStatus
            pillCell.layer.cornerRadius = 10.0
            pillCell.addBottomBorderWithColor(color: UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.0), width:2.0)
            return pillCell
        } else {
            let cell = eventCollectionView.dequeueReusableCell(withReuseIdentifier: eventCellIdentifier, for: indexPath)
            
            guard let eventCell = cell as? EventCollectionViewCell else {
                return cell
            }
            eventCell.setupLabels()
            return eventCell
        }
    }
}

extension ReminderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == reminderCollectionView {
            return CGSize(width: collectionView.bounds.width, height: 50)
        } else {
           return CGSize(width: collectionView.bounds.width , height: 90)
        }
    }
}

