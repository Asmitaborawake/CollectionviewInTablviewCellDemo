//
//  TableViewCell.swift
//  CollectionViewInTablviewDemo
//
//  Created by Asmita Borawake on 24/10/19.
//  Copyright © 2019 Asmita Borawake. All rights reserved.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var nameArray = ["iOS","Flutter","React Native","Web","Anguler"]
    var imgArray  = ["img","download","download","download (1)","Canada-Flag-Free-Download-PNG.png"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.clear
        
        self.addSubview(collectionView)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        
        cell.lbl.text = nameArray[indexPath.item]
        let imgname =  imgArray[indexPath.item]
        cell.imgView.image = UIImage(named: imgname)

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        print(indexPath.item)
        let data = nameArray[indexPath.item]
        let passdatacollectionviewdata = "CollectionViewCellPassData"
        let userInfo = [ "text" : data ]
        //post notification to pass collectionview cell data
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: passdatacollectionviewdata), object: nil, userInfo: userInfo)
    }
    
    
    

}

