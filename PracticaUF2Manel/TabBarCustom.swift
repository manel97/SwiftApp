//
//  TabBarCustom.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 23/01/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import UIKit

class TabBarCustom: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //esto es para cambiar el color segun esten seleccionados o no los items.
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)
        
        tabBarItem = self.tabBar.items![0]
        //Asignamos la imagen al elemento sin seleccionar
        tabBarItem.image = UIImage(named: "whiteHome")?.withRenderingMode(.alwaysOriginal)        
        // Y al seleccionado
        tabBarItem.selectedImage = UIImage(named: "blackHome")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items![1]
        //Asignamos la imagen al elemento sin seleccionar
        tabBarItem.image = UIImage(named: "whiteSearch")?.withRenderingMode(.alwaysOriginal)
        // Y al seleccionado
        tabBarItem.selectedImage = UIImage(named: "blackSearch")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items![2]
        tabBarItem.image = UIImage(named: "whiteProfile")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "blackProfile")?.withRenderingMode(.alwaysOriginal)
        
        tabBarItem = self.tabBar.items![3]
        tabBarItem.image = UIImage(named: "whiteMenu")?.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = UIImage(named: "blackMenu")?.withRenderingMode(.alwaysOriginal)
        
        //Este bucle es para que en todos los elementos del tab bar, salgan con una posicion exacta
        for index in 0...(tabBar.items!.count - 1){
            tabBarItem = self.tabBar.items![index]
            tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -30, right: 0);
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
