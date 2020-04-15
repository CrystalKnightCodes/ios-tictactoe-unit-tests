//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {    
    
    // Code the multiple ways a user can win.
    // 3 in a row, 3 in a column, or 2 diagonals
    
    // Return whether all top positions have the same mark.
    
    // Get top coordinates
    let topPositions = [(0,0), (1,0), (2,0)]
    
    // Transform top positions into marks
    let topMarks = topPositions.map { topPosition -> GameBoard.Mark? in
        return board[topPosition]
    }
    
    var playerDidWin = true
    
    for possibleMark in topMarks {
        
        if let mark = possibleMark {
            // there is a mark
            if mark != player {
                // player did not win
                playerDidWin = false
            }
        } else {
            // If the square is empty, player did not win
            playerDidWin = false
            break
        }
    }
    return playerDidWin
}
