//
//  EventCollectionViewCell.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit
import ChameleonFramework


class EventCollectionViewCell: UICollectionViewCell {
    
    var place: UILabel?
    var location: UILabel?
    var hour: UILabel?
    

    func setupLabels() {
        
        self.backgroundColor = UIColor.init(gradientStyle: .leftToRight, withFrame: self.frame, andColors: [UIColor(red:0.00, green:0.69, blue:0.91, alpha:1.0), UIColor(red:0.00, green:0.56, blue:0.98, alpha:1.0)])
            
        self.layer.cornerRadius = 10.0
        
        place = UILabel()
        location = UILabel()
        hour = UILabel()
        
        place?.text = "Doctor’s appointment"
        location?.text = "Saint Maria Hospital"
        hour?.text = "at 16:30"
        
        addSubview(hour!)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(place!)
        stackView.addArrangedSubview(location!)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.height.equalTo(self.frame.height * 0.7)
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
        }
        
        hour?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(stackView)
            make.height.equalTo(self.frame.height * 0.2)
            make.right.equalTo(self).offset(-5)
        })
        
    }

}
