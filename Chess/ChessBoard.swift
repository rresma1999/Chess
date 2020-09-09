//
//  ChessBoard.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation
import UIKit

class ChessBoard: NSObject {
    var board: [[Piece]]!
    var vc: ViewController!
    let ROWS = 8
    let COLS = 8
    var whiteKing: King!
    var blackKing: King!
    
    func getFrame(forRow row: Int, forCol col: Int) -> CGRect {
        // compute the x coordinate and y coordinate with some clever spacing
        let x = CGFloat(ViewController.SPACE_FROM_LEFT_EDGE + col * ViewController.TILE_SIZE)
        let y = CGFloat(ViewController.SPACE_FROM_TOP_EDGE + row * ViewController.TILE_SIZE)
        
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: ViewController.TILE_SIZE, height: ViewController.TILE_SIZE))
    }
    
    init(viewController: ViewController) {
        vc = viewController
        // initialize the board matrix with all dummy pieces first
        let oneRowOfBoard = Array(repeating: Dummy(), count: COLS)
        board = Array(repeating: oneRowOfBoard, count: ROWS)
    }
}
