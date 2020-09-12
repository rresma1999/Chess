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
        self.theChessBoard = ChessBoard(viewController: viewController)
    }
    
    // function to handle actual movement of a piece
    // start by marking source tile, then remove curr piece at dest tile, place moved piece on that tile, and replace source tile
    // with a Dummy piece
    func move(piece chessPieceToMove: UIChessPiece, fromIndex sourceIndex: BoardIndex, toIndex destIndex: BoardIndex, toOrigin destOrigin: CGPoint) {
        // get the initial chess piece frame
        let initialChessPieceFrame = chessPieceToMove.frame
        
        // get the piece at destination
        let pieceToRemove = self.theChessBoard.board[destIndex.row][destIndex.col]
        
        // remove the piece that is currently at the destination tile
        self.theChessBoard.remove(piece: pieceToRemove)
        
        // place the piece at the destination
        self.theChessBoard.place(chessPiece: chessPieceToMove, toIndex: destIndex, toOrigin: destOrigin)
        
        // finally, add a dummy piece in the vacant source tile
        self.theChessBoard.board[sourceIndex.row][sourceIndex.col] = Dummy(frame: initialChessPieceFrame)
    }
    
    // MARK: implement
    func isMoveValid(piece: UIChessPiece, fromIndex sourceIndex: BoardIndex, toIndex destIndex: BoardIndex) -> Bool {
        // check if the move is even on the board
        guard isMoveOnBoard(forPieceFrom: sourceIndex, thatGoesTo: destIndex) else {
            print("ERROR: MOVE IS NOT ON BOARD!")
            return false
        }
        return true
    }
    
    // determines if a chess move is actually on the board
    func isMoveOnBoard(forPieceFrom sourceIndex: BoardIndex, thatGoesTo destIndex: BoardIndex) -> Bool {
        if case 0..<self.theChessBoard.ROWS = sourceIndex.row {
            if case 0..<self.theChessBoard.COLS = sourceIndex.col {
                if case 0..<self.theChessBoard.ROWS = destIndex.row {
                    if case 0..<self.theChessBoard.COLS = destIndex.col {
                        return true
                    }
                }
            }
        }
        return false
    }
}
