//
//  ImagePreviewViewController.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {

    @IBOutlet weak var imagePreview: UIImageView!
    
    var photoTaken: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePreview.image = photoTaken
    }
    
    func setupImage(with image: UIImage) {
        photoTaken = image
    }

}
