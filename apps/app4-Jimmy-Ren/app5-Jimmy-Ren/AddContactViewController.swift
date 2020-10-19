//
//  AddContactViewController.swift
//  app5-Jimmy-Ren
//
//  Created by Jimmy Ren on 10/14/20.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: contact)
}

class AddContactViewController: UIViewController {
    weak var delegate: AddContactDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let newContact = createNewContact() {
            print(newContact)
            self.delegate?.didCreate(newContact)
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    func createNewContact() -> contact? {
        if let firstN = firstName.text, let lastN = lastName.text, let comp = company.text, let email = email.text, let phone = phoneNumber.text {
            if (firstN == "" || lastN == "" || comp == "" || email == "" || phone == "") {
                return nil
            } else {
                return contact(firstName: firstN, lastName: lastN, company: comp, email: email, phoneNumber: phone, userImage: nil)
            }
        }
        return nil
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
