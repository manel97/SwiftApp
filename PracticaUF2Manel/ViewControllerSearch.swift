//
//  ViewController.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 23/01/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var buscando:Bool = false
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buscando ? filteredPojos.count : listaPojos.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.allowsSelection = false
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! SearchTableViewCell        
        if buscando{
            myCell.cellTitle.text = filteredPojos[indexPath.row].pojoName
            myCell.cellImg.image = filteredPojos[indexPath.row].pojoImg
            myCell.isLiked.isHidden = filteredPojos[indexPath.row].isLiked ? false : true
        } else{
            myCell.cellTitle.text = listaPojos[indexPath.row].pojoName
            myCell.cellImg.image = listaPojos[indexPath.row].pojoImg
            myCell.isLiked.isHidden = listaPojos[indexPath.row].isLiked ? false : true
        }
        return myCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let estaLikeado = likedPojo(indexPath: indexPath)
        return UISwipeActionsConfiguration(actions: [estaLikeado])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //primero hago que la lista filtrada meta todos los pojos
        //que contengan lo que el usuario ha escrito en la barra
        filteredPojos = listaPojos.filter({$0.pojoName.lowercased().contains(searchText.lowercased())})
        //cambio el valor de buscando según me conviene a mi
        buscando = searchText != "" ? true : false
        tableView.reloadData()
    }
    
    func likedPojo(indexPath:IndexPath) -> UIContextualAction{
        //defino la accion que voy a realizar
        let action = UIContextualAction(style: .normal, title: "Like it") { (action, view, completion)  in
            listaPojos[indexPath.row].isLiked = !listaPojos[indexPath.row].isLiked
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.title = !listaPojos[indexPath.row].isLiked ? "Like" : "Nah"
        action.backgroundColor = listaPojos[indexPath.row].isLiked ? UIColor.lightGray : UIColor.gray
        return action
    }
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likedPojos = listaPojos.filter({$0.isLiked==true})
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.placeholder = "key words here"
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

