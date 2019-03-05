//
//  HomeTableView.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 29/01/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

var tools:Tools = Tools()
var counter:Int = 0

var listaMovies:[Movie] = [Movie]()
var filteredMovies:[Movie] = []
var likedMovies:[Movie] = []



//en esta pantalla hay que poder darle like con un boton de la celda de tableview

class HomeTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        myCell.cellTitle.text = listaMovies[indexPath.row].movieName
        myCell.cellDesc.text = listaMovies[indexPath.row].movieType
        //myCell.cellImg.image = listaPojos[indexPath.row].pojoImg
        //este if else pretende que los like se vean tanto en la pantalla search como en la home.
        
        let imatgeCsv = listaMovies[indexPath.row].movieImage
        if imatgeCsv == "null" {
            myCell.cellImg.image = UIImage(named: "notFound")
        } else{
            tools.getImage(imagenURL: listaMovies[indexPath.row].movieImage) { (recoveredImg) -> Void in
                if let caratula = recoveredImg{
                    DispatchQueue.main.async {
                        myCell.cellImg.image = caratula
                        return
                    }
                }
                
            }
        }
        if listaMovies[indexPath.row].isLiked == true {
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
            listaMovies[sender.tag].isLiked = false
        } else{
            sender.setImage(UIImage(named: "favorite"), for: .normal)
            listaMovies[sender.tag].isLiked = true
        }        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listaMovies[indexPath.row].movieName)
        //declaro una variable de tipo view controller y le digo que se comporte como
        //la clase pojoDetail.
        let vc = storyboard?.instantiateViewController(withIdentifier: "pojoDetail") as! PojoDetail
        vc.nombre = listaMovies[indexPath.row].movieName
        vc.descripcion = listaMovies[indexPath.row].movieType
        
        //le indicamos de donde saca las imagenes.
        let URL = NSURL(string: listaMovies[indexPath.row].movieImage)
        let data = try? Data(contentsOf: URL! as URL)
        if data == nil {
            vc.img = UIImage(named: "notFound")!
        } else{
            vc.img = UIImage(data: data!)!
        }
        
       
        counter = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tools.parseCSVMovies(movie: &listaMovies)
        
    }
}
