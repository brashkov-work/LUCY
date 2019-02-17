//
//  PillCollectioViewCell.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit

class PillCollectioViewCell: UICollectionViewCell {

    @IBOutlet weak var pillName: UILabel!
    
    @IBOutlet weak var reminderStatus: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }
    
    
    fileprivate func setupConstraints() {
        
        pillName.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        
        reminderStatus.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(pillName.snp.right).offset(10)
            make.bottom.equalTo(self).offset(-15)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(reminderStatus.snp.right).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.right.equalTo(self).offset(-10)
        }
    }

}
