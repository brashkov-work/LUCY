//
//  OCRViewController.swift
//  LUCY
//
//  Created by Boris Rashkov on 16.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit
import SwiftyCam

class OCRViewController: SwiftyCamViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shouldUseDeviceOrientation = false
        defaultCamera = .rear
        cameraDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        takePhoto()
    }
    
    fileprivate func openImagePreview(with image: UIImage) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "imagePreview") as! ImagePreviewViewController;
        print(vc)
        vc.setupImage(with: image)
        self.present(vc, animated: true, completion: nil);
    }
}
extension OCRViewController: SwiftyCamViewControllerDelegate {
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        
        openImagePreview(with: photo)
    }
}
