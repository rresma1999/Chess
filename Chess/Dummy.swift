//
//  Dummy.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation
import UIKit

/*
 Simple dummy class to act as a placeholder for an empty tile on the board
 */
class Dummy: Piece {
    // Store the underlying coordinates
    private var xStorage: CGFloat!
    private var yStorage: CGFloat!
    
    // x coordinate
    var x: CGFloat {
        get {
            return self.xStorage
        }
        set {
            self.xStorage = newValue
        }
    }
    
    // y coordinate
    var y: CGFloat {
        get {
            return self.yStorage
        }
        set {
            self.yStorage = newValue
        }
    }
    
    // CGRect Constructor
    init(frame: CGRect) {
        self.xStorage = frame.origin.x
        self.yStorage = frame.origin.y
    }
    
    // Empty Constructor
    init(){}
}
