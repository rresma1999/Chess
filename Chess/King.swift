//
//  King.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation
import UIKit

class King: UIChessPiece {
    // constructor
    init(frame: CGRect, color: UIColor, vc: ViewController) {
        super.init(frame: frame)
        if color == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) {
            self.text = "♚"
        } else {
            self.text = "♔"
        }
        
        self.isOpaque = false
        self.textColor = color
        self.isUserInteractionEnabled = true
        self.textAlignment = .center
        self.font = self.font.withSize(40)
        
        // add this king to our array of chess pieces
        vc.chessPieces.append(self)
        // render
        vc.view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
