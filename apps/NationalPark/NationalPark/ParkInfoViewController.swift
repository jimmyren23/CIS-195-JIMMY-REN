//
//  ParkInfoViewController.swift
//  NationalParks
//
//  Created by Jimmy Ren on 11/14/20.
//

import Foundation
import UIKit
import Kingfisher

class ParkInfoViewController: UIViewController {
    
    var name: String?;
    var pic: String?;
    var desig: String?;
    var descript: String?;

    @IBOutlet weak var parkName: UILabel!
    @IBOutlet weak var parkDesignation: UILabel!
    @IBOutlet weak var parkPicture: UIImageView!
    @IBOutlet weak var parkDescription: UITextView!
    
    override func viewDidLoad() {
        print("hello\n")
        super.viewDidLoad()
        print("bye\n")
        parkName.text = name;
        let picture = URL(string: pic!);
        parkPicture.kf.setImage(with: picture);
        parkDesignation.text = desig;
        parkDescription.text = descript;
    }
}
