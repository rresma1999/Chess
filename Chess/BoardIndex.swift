//
//  BoardIndex.swift
//  Chess
//
//  Created by Ryan Resma on 8/21/20.
//  Copyright © 2020 Ryan Resma. All rights reserved.
//

import Foundation

/*
 Helper struct to help work with chess board indices to actual frame locations
 */
struct BoardIndex: Equatable {
    var row: Int
    var col: Int
    
    // Int Constructor
    init(r: Int, c: Int) {
        self.row = r
        self.col = c
    }
    
    // Equatable true equality function
    // return true if lhs == rhs, false otw
    static func ==(lhs: BoardIndex, rhs: BoardIndex) -> Bool {
        return (lhs.row == rhs.row && lhs.col == rhs.col)
    }
}
