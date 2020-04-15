//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Christy Hicks on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    func testPlacingXOnEmptySquare() {
        // Place X on an empty square (0,0)
        // If the x was placed, fetch the mark on (0,0)
        // If mark is fetched, make sure that mark is an x
        
        var board = GameBoard()
        
        // Expecting that Assert throws error
       // XCTAssertThrowsError(try board.place(mark: .x, on: (0,0)))
        
        //Expect it not to throw an error
        XCTAssertNoThrow(try board.place(mark: .x, on: (0,0)))
        
        // If the x was placed, I want to fetch the mark on (0,0)
        let markOnEmptySquare = board[(0,0)]
       //XCTAssertNotNil(markOnEmptySquare)
        XCTAssert(markOnEmptySquare == .x, "The placed mark is different than the requested mark.")
    }
}
