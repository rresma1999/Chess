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
    var srcOrigin: CGPoint!
    var destOrigin: CGPoint!
    static var SPACE_FROM_LEFT_EDGE: Int = 27
    static var SPACE_FROM_TOP_EDGE: Int = 224
    static var TILE_SIZE: Int = 45
    
    var myChessGame: ChessGame!
    var chessPieces: [UIChessPiece]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

