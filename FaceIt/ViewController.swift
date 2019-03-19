//
//  ViewController.swift
//  FaceIt
//
//  Created by Dr. BingBing on 2019/3/19.
//  Copyright © 2019 Dr. BingBing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myFaceView: FaceView!
    
    var expression = FacialExpression(eyes: .open, mouth: .grin)
    
    private func updateUI() {
        
        switch expression.eyes {
        case .open:
            myFaceView.eyesOpen = true
        case .closed:
            myFaceView.eyesOpen = false
        case .squinting:
            myFaceView.eyesOpen = false
        }
    }
    
    private let mouthCurvature = [FacialExpression.Mouth.grin: 0.5]
}

