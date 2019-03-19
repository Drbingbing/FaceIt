//
//  ViewController.swift
//  FaceIt
//
//  Created by Dr. BingBing on 2019/3/19.
//  Copyright © 2019 Dr. BingBing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myFaceView: FaceView! {
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .closed, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        
        switch expression.eyes {
        case .open:
            myFaceView?.eyesOpen = true // use "?" protecting my outlett maybe not set
        case .closed:
            myFaceView?.eyesOpen = false
        case .squinting:
            myFaceView?.eyesOpen = false
        }
        myFaceView?.mouthCurvature = mouthCurvature[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvature = [FacialExpression.Mouth.grin: 0.5, .frown: -1.0, .smile: 1.0,
                                  .neutral: 0.0, .smirk: -0.5]
}

