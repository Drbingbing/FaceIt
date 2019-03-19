//
//  FacialExpression.swift
//  FaceIt
//
//  Created by Dr. BingBing on 2019/3/19.
//  Copyright © 2019 Dr. BingBing. All rights reserved.
//

import Foundation

struct FacialExpression {
    enum Eyes: Int {
        case open
        case closed
        case squinting
    }
    
    enum Mouth: Int {
        case frown
        case smirk
        case neutral
        case grin
        case smile
    
        var sadder : Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        var happier: Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    
    var sadder : FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    var happier : FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    // an expression to keep track of the state of the eyes and the mouth
    let eyes: Eyes
    let mouth: Mouth
}
