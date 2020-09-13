//
//  ViewController.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayTurnLabel: UILabel!
    @IBOutlet weak var displayCheckLabel: UILabel!
    
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    
    var pieceDragged: UIChessPiece!
    var sourceOrigin: CGPoint!
    var destOrigin: CGPoint!
    // constant vars to help with instantiation of chess board
    static var SPACE_FROM_LEFT_EDGE: Int = 27
    static var SPACE_FROM_TOP_EDGE: Int = 269
    static var TILE_SIZE: Int = 45
    // current chess game object
    var myChessGame: ChessGame!
    // model array
    var chessPieces: [UIChessPiece]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // instantiate model array and chess game object
        self.chessPieces = []
        self.myChessGame = ChessGame(viewController: self)
    }
    
    // triggered when piece is clicked or touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // only allow for user to drag chess pieces
        pieceDragged = touches.first!.view as? UIChessPiece
        if pieceDragged != nil {
            self.sourceOrigin = pieceDragged.frame.origin
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pieceDragged != nil {
            drag(piece: pieceDragged, usingGestureRecognizer: self.panGestureRecognizer)
        }
    }
    
    // MARK: ensure that the piece's location is valid
    // 1. make sure the center of the piece is in the center of the tile
    // 2. make sure that it is a legal move?
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pieceDragged != nil {
            // access the last touch
            let touchLocation = touches.first!.location(in: view)
            
            // determining the exact tile origin of the end location
            var x = Int(touchLocation.x)
            var y = Int(touchLocation.y)
            // subtract off the edge lengths and nullify the extra insets
            x -= ViewController.SPACE_FROM_LEFT_EDGE
            y -= ViewController.SPACE_FROM_TOP_EDGE
            x = (x / ViewController.TILE_SIZE) * ViewController.TILE_SIZE
            y = (y / ViewController.TILE_SIZE) * ViewController.TILE_SIZE
            
            // finally re-add the edge lengths
            x += ViewController.SPACE_FROM_LEFT_EDGE
            y += ViewController.SPACE_FROM_TOP_EDGE
            
            destOrigin = CGPoint(x: x, y: y)
            
            // calculate the exact tile index on the chess board
            let sourceIndex = ChessBoard.indexOf(origin: sourceOrigin)
            let destIndex = ChessBoard.indexOf(origin: destOrigin)
            
            // ensure that the move is actually legal
            if self.myChessGame.isMoveValid(piece: pieceDragged, fromIndex: sourceIndex, toIndex: destIndex) {
                self.myChessGame.move(piece: pieceDragged, fromIndex: sourceIndex, toIndex: destIndex, toOrigin: destOrigin)
                self.myChessGame.nextTurn()
                self.updateTurnOnScreen()
            } else {
                pieceDragged.frame.origin = sourceOrigin
            }
        }
    }
    
    // UI change made to turn label after every move
    func updateTurnOnScreen() {
        self.displayTurnLabel.text = self.myChessGame.isWhiteTurn ? "White's turn" : "Black turn"
        self.displayTurnLabel.textColor = self.myChessGame.isWhiteTurn ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

    // helper function to handle click and drag action
    func drag(piece: UIChessPiece, usingGestureRecognizer gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: view)
        piece.center = CGPoint(x: translation.x + piece.center.x, y: translation.y + piece.center.y)
        gestureRecognizer.setTranslation(CGPoint.zero, in: view)
    }
    
}

