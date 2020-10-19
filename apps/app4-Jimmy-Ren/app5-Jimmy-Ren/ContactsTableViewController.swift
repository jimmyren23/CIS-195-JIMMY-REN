//
//  ContactsTableViewController.swift
//  app5-Jimmy-Ren
//
//  Created by Jimmy Ren on 10/14/20.
//

import UIKit



class ContactsTableViewController: UITableViewController, AddContactDelegate {
    func didCreate(_ contact: contact) {
        print("hi friend")
        dismiss(animated: true, completion: nil)
        contacts.append(contact)
        contacts.sort(by: { $0.lastName < $1.lastName});
        self.tableView.reloadData()
    }
    
    var contacts: Array<contact> = [contact(firstName: "Jimmy", lastName: "Ren", company: "UPenn", email: "jren@upenn.edu", phoneNumber: "3312296692"), contact(firstName: "Bob", lastName: "Jerry", company: "Cornell", email: "bjerry@cornell.edu", phoneNumber: "3316394593")]
    var tempName = ""
    var tempCompany = ""
    var tempPhoneNumber = ""
    var tempEmail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }
    @IBAction func basicSegue(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        if let label = cell.viewWithTag(15) as? UILabel {
            label.text = contacts[indexPath.row].firstName + " " +  contacts[indexPath.row].lastName
        }
        if let label = cell.viewWithTag(2) as? UILabel {
            label.text = contacts[indexPath.row].company
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100.0
    }
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Deselect the cell, and toggle the "favorited" property in your model
        tableView.deselectRow(at: indexPath, animated: true)
        tempName = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].lastName
        tempEmail = contacts[indexPath.row].email
        tempCompany = contacts[indexPath.row].company
        tempPhoneNumber =  contacts[indexPath.row].phoneNumber
        performSegue(withIdentifier: "details", sender: self)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "details") {
            let detailVC = segue.destination as! DetailViewController
            detailVC.name = tempName
            detailVC.email = tempEmail
            detailVC.company = tempCompany
            detailVC.phoneNumber = tempPhoneNumber
        }
        if (segue.identifier == "add") {
            let NVC = segue.destination as! UINavigationController
            let addVC = NVC.topViewController as! AddContactViewController
            addVC.delegate = self
        }
    }
    
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
