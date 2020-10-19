//
//  ViewController.swift
//  app2_Ren_Jimmy
//
//  Created by Jimmy Ren on 9/15/20.
//  Copyright © 2020 Jimmy Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // player = true means its player 1's turn, o.w. player 2's turn
    var model = MyModel()
    @IBOutlet weak var TicTacToe: UILabel!
    @IBOutlet weak var Player1Score: UILabel!
    @IBOutlet weak var Player2Score: UILabel!
    @IBOutlet weak var GameStatus: UILabel!
    
    
    //Sets player 1 to be the
    override func viewDidLoad() {
        super.viewDidLoad()
        Player1Score.text = "Player 1 Score: " + String(model.oneScore)
        Player2Score.text = "Player 2 Score: " + String(model.twoScore)
        GameStatus.text = "Player 1's Turn"
        model.reset()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet var collectionOfButtons: [UIButton]!
    //change the image using asset
    @IBAction func tapped(sender: UIButton) {
        // See if the image needs to be switched
        let image = model.buttonChange(number: sender.tag - 1)
        // Check if the game drew or if a player won, otherwise will switch the image and game status
        if image == 1 {
            let buttonImage = UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate)
            sender.tintColor = .systemBlue
            sender.setImage(buttonImage,for:.normal)
            GameStatus.text = "Player 1's Turn"
        } else if image == 2{
            let buttonImage = UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate)
            sender.tintColor = .systemBlue
            sender.setImage(buttonImage,for:.normal)
            GameStatus.text = "Player 2's Turn"
        }
        if model.isWinner() {
            if !model.player {
                GameStatus.text = "Player 1 Wins"
                Player1Score.text = "Player 1 Score: " + String(model.oneScore)
            } else {
                GameStatus.text = "Player 2 Wins"
                Player2Score.text = "Player 2 Score: " + String(model.twoScore)
            }
            for button in collectionOfButtons {
                if model.winners.contains(button.tag - 1) {
                    button.tintColor = .systemYellow
                }
            }
            GameStatus.textColor = UIColor.green
        }
        if model.isDraw() {
            GameStatus.text = "Draw"
            for button in collectionOfButtons {
                button.tintColor = .systemGray
            }
        }
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        for button in collectionOfButtons {
            button.setImage(UIImage(named:"mark-none"),for:.normal)
        }
        model.reset()
        GameStatus.text = "Player 1's Turn"
        GameStatus.textColor = UIColor.black
    }
    


}

