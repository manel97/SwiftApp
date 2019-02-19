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
    
    
    var nombre:String = ""
    var descripcion:String = ""
    var img:UIImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pojoImagen.image = img
        pojoNombre.text = nombre
        pojoDescripcion.text = descripcion        
        isThePojoLiked.isHidden = listaPojos[counter].isLiked ? false : true
    }
}
