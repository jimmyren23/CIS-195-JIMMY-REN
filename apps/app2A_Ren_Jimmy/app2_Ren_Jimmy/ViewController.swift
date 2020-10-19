//
//  ViewController.swift
//  app2_Ren_Jimmy
//
//  Created by Jimmy Ren on 9/15/20.
//  Copyright © 2020 Jimmy Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TicTacToe: UILabel!
    
    @IBOutlet weak var Player1Score: UILabel!
    @IBOutlet weak var Player2Score: UILabel!
    @IBOutlet weak var GameStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var collectionOfButtons: [UIButton]!
    //change the image using asset
    @IBAction func tapped(sender: UIButton) {
        if Bool.random() {
            sender.setImage(UIImage(named:"mark-o"),for:.normal)
        } else {
            sender.setImage(UIImage(named:"mark-x"),for:.normal)
        }
        print(sender.tag)
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        for button in collectionOfButtons {
            button.setImage(UIImage(named:"mark-none"),for:.normal)
        }
    }
    


}

