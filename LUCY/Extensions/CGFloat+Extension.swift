//
//  CGFloat+Extension.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
