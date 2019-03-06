//
//  ProfileViewController.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 15/02/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionCell
        
        let imatgeCsv = likedMovies[indexPath.row].movieImage
        if imatgeCsv == "null" {
            myCell.collectionCellImg.image = UIImage(named: "notFound")
        } else{
            tools.getImage(imagenURL: likedMovies[indexPath.row].movieImage) { (recoveredImg) -> Void in
                if let caratula = recoveredImg{
                    DispatchQueue.main.async {
                        myCell.collectionCellImg.image = caratula
                        return
                    }
                }
                
            }
        }

        
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout        
        //le quitamos al layout los espaciados minimos.
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //le seteamos a nuestro collection view el layout que acabamos de crear.
        collectionView.collectionViewLayout = layout
        //entonces le decimos que el width de cada celda sera el maximo de la pantalla / 3 (y le restaremos 2, 1 para cada margen)
        let maxWidth = (collectionView.bounds.width/3) - 2
        //y como queremos elementos cuadrados iguales, usaremos el valor del maxWidth tmbn para el maxHeight con +2 para añadir algo de margen.
        return CGSize(width: maxWidth, height: maxWidth + 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //esta funcion es para entrar en la pagina de detalle de una pelicula desde tu perfil.
        let precio = likedMovies[indexPath.row].moviePrice
        let vc = storyboard?.instantiateViewController(withIdentifier: "pojoDetail") as! PojoDetail
        vc.nombre = likedMovies[indexPath.row].movieName
        vc.descripcion = likedMovies[indexPath.row].movieType
        vc.precio = "Precio online: \(precio)"
        
        //le indicamos de donde saca las imagenes.
        let URL = NSURL(string: likedMovies[indexPath.row].movieImage)
        let data = try? Data(contentsOf: URL! as URL)
        if data == nil {
            vc.img = UIImage(named: "notFound")!
        } else{
            vc.img = UIImage(data: data!)!
        }
        counter = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        likedMovies = listaMovies.filter({$0.isLiked==true})
        print(likedMovies)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        collectionView.delegate = self
        collectionView.dataSource = self        
        print(likedMovies)
    }
}
