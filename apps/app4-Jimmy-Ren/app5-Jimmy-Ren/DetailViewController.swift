//
//  DetailViewController.swift
//  app5-Jimmy-Ren
//
//  Created by Jimmy Ren on 10/14/20.
//

import UIKit

class DetailViewController: UIViewController {
    var name: String = ""
    var email: String = ""
    var company: String = ""
    var phoneNumber: String = ""

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    
    override func viewDidLoad() {
        labelName.text = name
        labelCompany.text = company
        labelEmail.text = email
        labelPhone.text = phoneNumber
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
