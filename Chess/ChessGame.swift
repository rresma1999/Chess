//
//  ChessGame.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation
import UIKit

class ChessGame: NSObject {
    // current chess board object
    var theChessBoard: ChessBoard!
    
    // constructor
    init(viewController: ViewController) {
        theChessBoard = ChessBoard(viewController: viewController)
    }
    
    // MARK: implement
    func isMoveValid(piece: UIChessPiece, fromIndex sourceIndex: BoardIndex, toIndex destIndex: BoardIndex) -> Bool {
        return false
    }
}
