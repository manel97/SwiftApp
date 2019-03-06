//
//  PojoDetail.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 30/01/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

class PojoDetail: UIViewController {
    
    
    @IBOutlet weak var pojoImagen: UIImageView!
    @IBOutlet weak var pojoNombre: UILabel!
    @IBOutlet weak var pojoDescripcion: UILabel!
    @IBOutlet weak var isThePojoLiked: UIImageView!
    @IBOutlet weak var pojoPrecio: UILabel!
    @IBOutlet weak var pojoLorem: UILabel!
    
    
    var nombre:String = ""
    var descripcion:String = ""
    var precio = ""
    var img:UIImage = UIImage()
    var lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pojoImagen.image = img
        pojoNombre.text = nombre
        pojoDescripcion.text = descripcion
        pojoPrecio.text = precio
        pojoLorem.text = lorem
        isThePojoLiked.isHidden = listaMovies[counter].isLiked ? false : true
    }
}
