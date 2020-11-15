//
//  ViewController.swift
//  NationalParks
//
//  Created by Jimmy Ren on 11/14/20.
//

import UIKit
import Kingfisher
import Firebase

class ViewController: UITableViewController {
    
    var parks = [Park]()
    let endpoint: String = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=zx88LH3ULml3BkL5BJLtXtshfXjroMvZWTzDIl7i"
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveData()
        refreshControl = UIRefreshControl();
        refreshControl?.addTarget(self, action:
        #selector(handleRefreshControl),
        for: .valueChanged)
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
    }
    
//    private func makeAPIRequest() {
//        // URLSession code
//        let url = URL(string: endpoint)!
//        let urlRequest = URLRequest(url: url)
//        print("LETS GO")
//        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            guard let data = data, error == nil else {
//                print("Error: API request failed...")
//                return
//            }
//            if let APIResponse = try?
//                JSONDecoder().decode(APIResponse.self, from: data) {
//                DispatchQueue.main.async {
//                    self.parks = APIResponse.data
//                    self.tableView.reloadData()
//                }
//            }
//        }
//
//
//
//        // Actually run the URLSession
//        task.resume()
//    }
    private func retrieveData() {
        DispatchQueue.main.async {
            self.db.collection("parks").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data();
                        let url = data["images"] as! String;
                        let name = data["fullName"] as! String;
                        let desc = data["description"] as! String;
                        let desig = data["designation"] as! String;
                        var images = [Image]();
                        images.append(Image(url: url));
                        let park = Park(name: name, description: desc, designation: desig, images: images);
                        self.parks.append(park);
                    }
                }
                self.tableView.reloadData();
            }
        }
    }
    
    
    
    
    
    
    @objc func handleRefreshControl() {
//        makeAPIRequest();
        retrieveData()
       // Dismiss the refresh control.
       DispatchQueue.main.async {
          self.refreshControl?.endRefreshing()
       }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "park", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel{
            label.text = parks[indexPath.row].name
        }
        
        
        if let designation = cell.viewWithTag(2) as? UILabel{
            designation.text = parks[indexPath.row].designation
        }

        if let pic = cell.viewWithTag(3) as? UIImageView {
           var image: URL;
           if (parks[indexPath.row].images.count != 0) {
               image = URL(string: parks[indexPath.row].images[0].url)!;
           } else {
               image = URL(string: "https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg")!;
           }
           pic.kf.setImage(with: image);
        }
        return cell
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "park", for: indexPath)
//        if let label = cell.viewWithTag(1) as? UILabel{
//            label.text = parks[indexPath.row].name
//        }
//
//
//        if let designation = cell.viewWithTag(2) as? UILabel{
//            designation.text = parks[indexPath.row].designation
//        }
//
//        if let pic = cell.viewWithTag(3) as? UIImageView {
//           var image: URL;
//           if (parks[indexPath.row].images.count != 0) {
//               image = URL(string: parks[indexPath.row].images[0].url)!;
//                db.collection("parks").addDocument(data: [
//                    "fullName": parks[indexPath.row].name,
//                    "designation": parks[indexPath.row].designation,
//                    "description": parks[indexPath.row].description,
//                    "images": parks[indexPath.row].images[0].url,
//                ])
//           } else {
//               image = URL(string: "https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg")!;
//            db.collection("parks").addDocument(data: [
//                "fullName": parks[indexPath.row].name,
//                "designation": parks[indexPath.row].designation,
//                "description": parks[indexPath.row].description,
//                "images": "https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg",
//            ])
//           }
//           pic.kf.setImage(with: image);
//        }
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // Handle segue
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: "Details", sender: parks[indexPath.row]);
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier! == "Details" {
           if let screen = segue.destination as? ParkInfoViewController {
               let parkInfo = sender as! Park
               screen.name = parkInfo.name;
               if (parkInfo.images.count != 0) {
                   screen.pic = parkInfo.images[0].url;
               } else {
                   screen.pic = "https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg";
               }
               screen.desig = parkInfo.designation;
               screen.descript = parkInfo.description;
           }
       }
   }


}
