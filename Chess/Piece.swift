//
//  Piece.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation

/*
 Piece protocol only retains x and y coordinate locations
 */
protocol Piece {
    var x: CGFloat {get set}
    var y: CGFloat {get set}
}
