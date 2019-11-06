//
//  DetailsViewController.swift
//  CollectionViewInTablviewDemo
//
//  Created by Asmita Borawake on 25/10/19.
//  Copyright © 2019 Asmita Borawake. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var data = String()
    
    @IBOutlet weak var lbl: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       lbl.text = data
    }
    

    
}
