//
//  ViewController.swift
//  FaceIt
//
//  Created by Dr. BingBing on 2019/3/19.
//  Copyright © 2019 Dr. BingBing. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    
    @IBOutlet weak var myFaceView: FaceView! {
        didSet {
            // creating face handler to big or small
            let handler = #selector(FaceView.changeScale(byReactingTo:)) 
            let pinchRecognizer = UIPinchGestureRecognizer(target: myFaceView, action: handler) 
            myFaceView.addGestureRecognizer(pinchRecognizer)
            
            // togggle eye handler
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingTo:)))
            // use "self" because target it's not myFaceView
            tapRecognizer.numberOfTapsRequired = 1
            myFaceView.addGestureRecognizer(tapRecognizer)
            
            // happier or sadder handler
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            swipeUpRecognizer.direction = .up
            myFaceView.addGestureRecognizer(swipeUpRecognizer)
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            swipeDownRecognizer.direction = .down
            myFaceView.addGestureRecognizer(swipeDownRecognizer)
            
            updateUI()
        }
    }
    
    // controll eyes close or open
    @objc func toggleEyes(byReactingTo tapgestureRecognizer: UITapGestureRecognizer) {
        if tapgestureRecognizer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    // happier or sadder
    @objc func increaseHappiness() {
        expression = expression.happier
    }
    @objc func decreaseHappiness() {
        expression = expression.sadder
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

