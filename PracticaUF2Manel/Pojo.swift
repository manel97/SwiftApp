//
//  Pojo.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 29/01/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

class Pojo{
    
    var pojoName:String
    var pojoDesc:String
    var pojoImg:UIImage = UIImage()
    var isLiked:Bool = false
    
    init(pojoName:String, pojoDesc:String, pojoImg:UIImage) {
        
        self.pojoName = pojoName
        self.pojoDesc = pojoDesc
        self.pojoImg = pojoImg
    }
    
}
