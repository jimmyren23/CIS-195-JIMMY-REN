import UIKit

class NewsfeedTableViewController: UITableViewController {
    
    var newsItems = [NewsItem]()
    
    // MARK: IBAction
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        // TODO: Present an alert view with a text field. When "Done" is pressed, a new NewsItem should be created and inserted at the START of your array of items, and the table view data should be reloaded
        let alertController = UIAlertController(title: "New Name", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let done = UIAlertAction(title: "Done", style: .default) { [unowned alertController] _ in
            let answer = alertController.textFields![0].text
            if let title = answer {
                self.newsItems.insert(NewsItem(isFavorited: false, postTitle: title), at: 0)
            }
            self.tableView.reloadData()
        }
        alertController.addAction(cancel)
        alertController.addAction(done)
        present(alertController, animated: true)
    }

    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)
        if let label = cell.viewWithTag(5) as? UILabel {
            label.text = newsItems[indexPath.row].postTitle
        }
        if let image = cell.viewWithTag(4) as? UIImageView {
            if newsItems[indexPath.row].isFavorited {
                image.image = UIImage(named: "star-filled")
            } else {
                image.image = UIImage(named: "star-hollow")
            }
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
        newsItems[indexPath.row].isFavorited.toggle()
        self.tableView.reloadData()
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
        if editingStyle == .delete {
           newsItems.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
       }
    }

}

