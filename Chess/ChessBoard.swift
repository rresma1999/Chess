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
    
    // class function to return the exact tile index of the passed in origin
    static func indexOf(origin: CGPoint) -> BoardIndex {
        // convert from CG Point to Tile units
        let row = (Int(origin.y) - ViewController.SPACE_FROM_TOP_EDGE) / ViewController.TILE_SIZE
        let col = (Int(origin.y) - ViewController.SPACE_FROM_LEFT_EDGE) / ViewController.TILE_SIZE
        return BoardIndex(r: row, c: col)
    }
    
    // class function to return the frame for any chess board based on the (r, c)
    static func getFrame(forRow row: Int, forCol col: Int) -> CGRect {
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
        // iterate through every cell in our chess matrix and instantiate pieces as needed
        for row in 0..<ROWS {
            for col in 0..<COLS {
                // real pieces will occur on rows 0, 1 (for the black pieces), 6, and 7 (for the white pieces)
                switch row {
                case 0:
                    switch col {
                    case 0:
                        board[row][col] = Rook(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    case 1:
                        board[row][col] = Knight(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    case 2:
                        board[row][col] = Bishop(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    case 3:
                        board[row][col] = Queen(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    case 4:
                        self.blackKing = King(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                        board[row][col] = self.blackKing
                    case 5:
                        board[row][col] = Bishop(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    case 6:
                        board[row][col] = Knight(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    default:
                        board[row][col] = Rook(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                    }
                case 1:
                    // pawns only row
                    board[row][col] = Pawn(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), vc: vc)
                case 6:
                    // pawns only row
                    board[row][col] = Pawn(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                case 7:
                    switch col {
                    case 0:
                        board[row][col] = Rook(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    case 1:
                        board[row][col] = Knight(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    case 2:
                        board[row][col] = Bishop(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    case 3:
                        board[row][col] = Queen(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    case 4:
                        self.whiteKing = King(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                        board[row][col] = self.whiteKing
                    case 5:
                        board[row][col] = Bishop(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    case 6:
                        board[row][col] = Knight(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    default:
                        board[row][col] = Rook(frame: ChessBoard.getFrame(forRow: row, forCol: col), color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), vc: vc)
                    }
                default:
                    // dummy pieces case (empty tiles)
                    board[row][col] = Dummy(frame: ChessBoard.getFrame(forRow: row, forCol: col))
                }
            }
        }
    }
}
