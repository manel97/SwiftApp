//
//  ProfileViewController.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 15/02/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedPojos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionCell
        
        myCell.collectionCellImg.image = likedPojos[indexPath.row].pojoImg
        myCell.collectionCellName.text = likedPojos[indexPath.row].pojoName
        
        return myCell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self        
        likedPojos = listaPojos.filter({$0.isLiked==true})
        print(likedPojos)
    }
    
}
