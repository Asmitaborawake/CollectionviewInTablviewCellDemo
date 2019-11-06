//
//  TableViewController.swift
//  CollectionViewInTablviewDemo
//
//  Created by Asmita Borawake on 24/10/19.
//  Copyright © 2019 Asmita Borawake. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data = ["1","2","3","4","5"]
    var valueToPass = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register to receive notification for get collection view cell data
       let passdatacollectionviewdata = "CollectionViewCellPassData"
        NotificationCenter.default.addObserver(self, selector: #selector(pushToNew), name: NSNotification.Name(rawValue: passdatacollectionviewdata), object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 5
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2{
            return 88
        }else {
            return 44
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //set appropriate cell
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalcell", for: indexPath) as! NormalTableViewCell
            cell.textLabel?.text = data[indexPath.row]
            
            
            return cell
        }
       
        
    }
  override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let displayVC : DetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        displayVC.data = data[indexPath.row]
    navigationController?.pushViewController(displayVC, animated: true)
    
    
    }
    
    //pass collectionview cell data to details view controller for that use notification center
    @objc func pushToNew(notification: Notification) {
        
        
        let displayVC : DetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        guard let text = notification.userInfo?["text"] as? String else { return }
        print ("text: \(text)")
        displayVC.data = text
         navigationController?.pushViewController(displayVC, animated: true)
    }
   

    
}





