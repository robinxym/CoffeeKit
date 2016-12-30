//
//  MasterViewController.swift
//  CoffeeKit
//
//  Created by Xue Yong Ming on 28/12/2016.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

  var detailViewController: DetailViewController? = nil
  var objects = [Venue]()


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem

    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
    self.navigationItem.rightBarButtonItem = addButton
    if let split = self.splitViewController {
        let controllers = split.viewControllers
        self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
    
    //https://api.Foursquare.com/v2/venues/search?client_id=UQRJNCYNHU3OUIO3FJFZE32WSUI3N4RRWZ2LYHFZIHHIQTRS&client_secret=TDPUSTQ5ZSCS3BO0IZW0JFQDOQSJPS0O0LSIXQE3BQUO2MVQ&v=20161229&ll=37.33,-122.03&categoryId=4bf58dd8d48988d1e0931735
//    WSManager.shared.getCafes(by: "37.33,-122.03", successHandler: { (cafe) in
//      self.objects = cafe.response.venues
//      DispatchQueue.main.async {
//        self.tableView.reloadData()
//      }
//    }) { (error) in
//    }
    let manager = WSManager.shared
    manager.baseURLString = "https://api.Foursquare.com/"
    manager.defaultParametersDictionary = ["client_id": manager.clientId, "client_secret": manager.clientSecret, "categoryId": manager.categoryId, "v": manager.dateString]
    WSManager.shared.callWebService(do: .GET, to: "https://api.Foursquare.com/", at: "v2/venues/search", with: ["ll": "37.33,-122.03"], success: { (dict: Dictionary<String, Any>) in
      let cafe = Cafe(fromDictionary: dict as NSDictionary)
      self.objects = cafe.response.venues
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }) { (error) in

    }
  }

  override func viewWillAppear(_ animated: Bool) {
    self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func insertNewObject(_ sender: Any) {
//    objects.insert(NSDate(), at: 0)
//    let indexPath = IndexPath(row: 0, section: 0)
//    self.tableView.insertRows(at: [indexPath], with: .automatic)
  }

  // MARK: - Segues

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
//        if let indexPath = self.tableView.indexPathForSelectedRow {
//            let object = objects[indexPath.row] as! NSDate
//            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//            controller.detailItem = object
//            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
//            controller.navigationItem.leftItemsSupplementBackButton = true
//        }
    }
  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let object = objects[indexPath.row] as Venue
    cell.textLabel!.text = object.name
    let nf = NumberFormatter()
    nf.groupingSeparator = ","
    nf.numberStyle = .decimal
    cell.detailTextLabel?.text = nf.string(from: object.location.distance as NSNumber)! + " m"
    return cell
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        objects.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }


}

