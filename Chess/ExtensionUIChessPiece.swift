//
//  ExtensionUIChessPiece.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation
import UIKit

typealias UIChessPiece = UILabel

/*
 UIChessPiece aliased for UILabel should conform to the Piece protocol
 */
extension UIChessPiece: Piece {
    // x coordinate
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    // y coordinate
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    // wrapper for textColor property for UILabel
    var color: UIColor {
        get {
            return self.textColor
        }
    }
}
