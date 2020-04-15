//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol BoardViewControllerDelegate: class {
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate)
}

class BoardViewController: UIViewController {
        // MARK: - Properties
    
    var board: GameBoard? {
        didSet {
            updateButtons()
        }
    }
    
    weak var delegate: BoardViewControllerDelegate?
    
    @IBOutlet var buttons: [UIButton]! {
        didSet {
                    for button in buttons {
                button.layer.borderWidth = 2.0
                button.layer.borderColor = UIColor.black.cgColor
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButtons()
    }
    
    @IBAction func mark(_ sender: UIButton) {
        let tag = sender.tag
              let x = tag % 3
              let y = tag / 3
        
        delegate?.boardViewController(self, markWasMadeAt: (x, y))
    }
    
    // MARK: - Private

    private func updateButtons() {
        // Make sure the board is set
        guard let board = board, isViewLoaded else { return }
        
        // Populate board with existing marks
        for x in 0..<3 {
            for y in 0..<3 {
                
                // coordinate based on both loops
                let coord = (x, y)
                let button = self.button(for: coord)
                
                // If the coordinate has a mark, we set the buttons title to the mark
                if let mark = board[coord] {
                    button.setTitle(mark.stringValue, for: .normal)
                } else {
                    button.setTitle(" ", for: .normal)
                }
            }
        }
    }
    
    private func button(for coordinate: Coordinate) -> UIButton {
        let tag = coordinate.y * 3 + coordinate.x
        return view.viewWithTag(tag) as! UIButton
    }
}
