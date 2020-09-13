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
    // turn var
    var isWhiteTurn: Bool = true
    
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
        guard self.isMoveOnBoard(forPieceFrom: sourceIndex, thatGoesTo: destIndex) else {
            print("ERROR: MOVE IS NOT ON BOARD!")
            return false
        }
        // check for correct player moving on their turn
        guard self.isTurnColor(sameAsPiece: piece) else {
            print("ERROR: WRONG TURN")
            return false
        }
        return self.isNormalMoveValid(forPiece: piece, fromIndex: sourceIndex, toIndex: destIndex)
    }
    
    // determines if a piece is actually moved (not picked up and replaced on same spot)
    func isNormalMoveValid(forPiece piece: UIChessPiece, fromIndex source: BoardIndex, toIndex dest: BoardIndex) -> Bool {
        // check BoardIndex equality
        guard source != dest else {
            print("ERROR: MOVING PIECE ONTO ITS CURRENT POSITION")
            return false
        }
        // see if we are attacking an allied piece
        guard !self.isAttackingAlliedPiece(sourceChessPiece: piece, destIndex: dest) else {
            print("ERROR: FRIENDLY FIRE! ATTACKING ALLIED PIECE")
            return false
        }
        return true
    }
    
    // determines if friendly fire is occurring in the current turn
    func isAttackingAlliedPiece(sourceChessPiece: UIChessPiece, destIndex: BoardIndex) -> Bool {
        // grab destination tile from chess board
        let destPiece = self.theChessBoard.board[destIndex.row][destIndex.col]
        guard !(destPiece is Dummy) else {
            return false
        }
        let destChessPiece = destPiece as! UIChessPiece
        return (sourceChessPiece.color == destChessPiece.color)
    }
    
    // simple function to flip the current turn
    func nextTurn() {
        isWhiteTurn = !isWhiteTurn
    }
    
    // ensure that players only move on their own turn
    func isTurnColor(sameAsPiece piece: UIChessPiece) -> Bool {
        if piece.color == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) {
            return !isWhiteTurn
        } else {
            return isWhiteTurn
        }
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
