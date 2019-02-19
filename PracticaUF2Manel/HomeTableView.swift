//
//  HomeTableView.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 29/01/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit


var counter:Int = 0
var listaPojos:[Pojo] = [
    Pojo(pojoName: "Pojo 1", pojoDesc: "Soy un plain old java object, lorem ipsum bla bla bla bla bla bla bla bla bla", pojoImg: UIImage(named: "pojo1")!),
    Pojo(pojoName: "Pojo 2", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "cr")!),
    Pojo(pojoName: "Pojo 3", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "airpod")!),
    Pojo(pojoName: "Pojo 4", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "flat")!),
    Pojo(pojoName: "Pojo 5", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "asian")!),
    Pojo(pojoName: "Pojo 6", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "regular")!),
    Pojo(pojoName: "Pojo 7", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "bleach")!),
    Pojo(pojoName: "Pojo 8", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "lol")!),
    Pojo(pojoName: "Pojo 9", pojoDesc: "Soy un plain old java object, dame algo...", pojoImg: UIImage(named: "xd")!)
]

var filteredPojos:[Pojo] = []
var likedPojos:[Pojo] = []

//en esta pantalla hay que poder darle like con un boton de la celda de tableview

class HomeTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPojos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        myCell.cellTitle.text = listaPojos[indexPath.row].pojoName
        myCell.cellDesc.text = listaPojos[indexPath.row].pojoDesc
        myCell.cellImg.image = listaPojos[indexPath.row].pojoImg
        //este if else pretende que los like se vean tanto en la pantalla search como en la home.
        if listaPojos[indexPath.row].isLiked == true {
            myCell.heartImg.setImage(UIImage(named: "favorite"), for: .normal)
        } else{
            myCell.heartImg.setImage(UIImage(named: "emptyHeart"), for: .normal)
        }
        //myCell.isLiked.isHidden = listaPojos[indexPath.row].isLiked ? false : true
        //le ponemos el tag que toca a cada boton.
        myCell.heartImg.tag = indexPath.row
        //añadimos evento de click
        myCell.heartImg.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        return myCell
    }
    
    @objc func clicked(sender:UIButton){
        
        if sender.image(for: .normal) == UIImage(named: "favorite") {
            sender.setImage(UIImage(named: "emptyHeart"), for: .normal)
            listaPojos[sender.tag].isLiked = false
            /*for pojo in likedPojos{
                if (pojo.isLiked == false){
                    likedPojos.remove(at: sender.tag)
                }
            }*/
            
        } else{
            sender.setImage(UIImage(named: "favorite"), for: .normal)
            listaPojos[sender.tag].isLiked = true
            likedPojos.append(listaPojos[sender.tag])
        }
        //print("pulsaste el boton \(sender.tag)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listaPojos[indexPath.row].pojoName)        
        //declaro una variable de tipo view controller y le digo que se comporte como
        //la clase pojoDetail.
        let vc = storyboard?.instantiateViewController(withIdentifier: "pojoDetail") as! PojoDetail
        vc.nombre = listaPojos[indexPath.row].pojoName
        vc.descripcion = listaPojos[indexPath.row].pojoDesc
        vc.img = listaPojos[indexPath.row].pojoImg
        counter = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        likedPojos = listaPojos.filter({$0.isLiked==true})
        
    }
    
}
