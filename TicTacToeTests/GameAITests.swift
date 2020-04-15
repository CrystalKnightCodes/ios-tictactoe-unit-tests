//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Christy Hicks on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinningConditionForXTopRow() {
        winningConditionForTopRow(mark: .x)
    }
    
    func testWinningConditionForOTopRow() {
        winningConditionForTopRow(mark: .o)
    }
    
    func winningConditionForTopRow(mark: GameBoard.Mark) {
        // Place marks on the top row.
        var board = GameBoard()
        XCTAssertNoThrow( try board.place(mark: mark, on: (0,0)))
        XCTAssertNoThrow( try board.place(mark: mark, on: (1,0)))
        XCTAssertNoThrow( try board.place(mark: mark, on: (2,0)))
        
        // Mark should win.
        let xPlayerDidWin = game(board: board, isWonBy: mark)
        XCTAssert(xPlayerDidWin)
    }
}

