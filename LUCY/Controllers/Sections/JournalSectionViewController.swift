//
//  JournalSectionViewController.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit

class JournalSectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let cellIdentifier = "reminder"
    fileprivate let sectionHeader = "sectionHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Home")
    }
    
    fileprivate func configureCollectionView() {
        collectionView.register(UINib(nibName: "ReminderCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(UINib(nibName: "ReminderSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionHeader)
        
        
    }

}

extension JournalSectionViewController: UICollectionViewDelegate {
    
}

extension JournalSectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionHeader, for: indexPath) as? ReminderSectionHeaderView else {
                fatalError("Invalid view type")
            }
            
            let section = indexPath.section
            
            let title: String?
            
            switch section {
            case 0:
                title = "Upcoming Events"
            default:
                title = "Other Events"
            }
            
            
            headerView.sectionTitle.text = title
            return headerView
            
        default:
            assert(false, "Invalid element type")
            print("footer")
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        guard let reminderCell = cell as? ReminderCell else {
            return cell
        }
        
        reminderCell.layer.cornerRadius = 10.0
        reminderCell.dropShadow(color: .black, opacity: 0.18, offSet: CGSize(width: 0, height: 2.0), radius: 10, scale: true)
        
        return reminderCell
    }
}

extension JournalSectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 32, height: 395)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 30)
    }
}


