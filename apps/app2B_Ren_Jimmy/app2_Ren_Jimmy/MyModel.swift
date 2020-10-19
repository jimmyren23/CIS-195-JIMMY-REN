//
//  MyModel.swift
//  app2_Ren_Jimmy
//
//  Created by Jimmy Ren on 9/22/20.
//  Copyright © 2020 Jimmy Ren. All rights reserved.
//

import Foundation

struct MyModel {
    //button array, with states 0, 1, 2. If 0, this is when there is none. 1 is mark-x, and 2 is mark-o.
    var buttons: Array<Int> =  Array(repeating: 0, count: 9)
    var playing = true
    var oneScore = 0;
    var twoScore = 0;
    var winners: Array<Int> = []
//    var twoScore = 0
    // Player 1 is true, Player 2 is false
    var player = true;
    //methods to interact
 
    // Resets the board, resumes play and sets Player 1 to be the first player to go
    mutating func reset() {
        buttons =  Array(repeating: 0, count: 9)
        playing = true
        player = true
        winners = []
    }
    
    // Changes to X's and O's
    mutating func buttonChange(number: Int) -> Int{
        if playing {
            if buttons[number] == 0 {
                if player {
                    buttons[number] = 1
                    player = false
                    return 1;
                } else {
                    buttons[number] = 2
                    player = true
                    return 2;
                }
            }
        }
        return -1;
    }
    mutating func isDraw() -> Bool {
        if playing {
            if !buttons.contains(0) {
                playing = false
                return true
            }
        }
        return false
    }
    
    mutating func updateScore() {
        if !player {
            oneScore += 1;
        } else {
            twoScore += 1;
        }
    }
    // Checks if there is a winner; if there is, playing stops.
    mutating func isWinner() -> Bool {
        // rows
        for i in 0...2 {
            if buttons[3 * i] == buttons[3 * i + 1] && buttons[3 * i] == buttons[3 * i + 2] {
                if buttons[3 * i] != 0 && buttons[3 * i + 1] != 0 && buttons[3 * i + 2] != 0 {
                    winners.append(3*i)
                    winners.append(3*i+1)
                    winners.append(3*i+2)
                    playing = false
                    updateScore()
                    return true
                }
            }
        }
        // columns
        for i in 0...2 {
            if buttons[i] == buttons[i + 3] && buttons[i] == buttons[i + 6] {
                if buttons[i] != 0 && buttons[i + 3] != 0 && buttons[i + 6] != 0 {
                    winners.append(i)
                    winners.append(i + 3)
                    winners.append(i + 6)
                    playing = false
                    updateScore()
                    return true
                }
            }
        }
        // diagonals
        if buttons[2] == buttons[4] && buttons[2] == buttons[6] {
            if buttons[2] != 0 && buttons[4] != 0 && buttons[6] != 0 {
                winners.append(2)
                winners.append(4)
                winners.append(6)
                playing = false
                updateScore()
                return true
            }
        }
        if buttons[0] == buttons[4] && buttons[0] == buttons[8] {
            if buttons[0] != 0 && buttons[4] != 0 && buttons[8] != 0 {
                winners.append(0)
                winners.append(4)
                winners.append(8)
                playing = false
                updateScore()
                return true
            }
        }
        return false
    }
}
