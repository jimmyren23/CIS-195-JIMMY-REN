//
//  ViewController.swift
//  app0_Ren_Jimmy
//
//  Created by Jimmy Ren on 9/11/20.
//  Copyright © 2020 Jimmy Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Color: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBAction func ColorChange(_ sender: Any) {
        if Color.text == "Blue" {
            Color.text = "Black"
            button.setTitle("Original", for:.normal)
            Color.textColor = UIColor.black
        } else {
            Color.text = "Blue"
            button.setTitle("Changed", for:.normal)
            Color.textColor = UIColor.blue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

