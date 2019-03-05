//
//  Movie.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 05/03/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

class Movie{
    
    var movieName: String = ""
    var movieType: String = ""
    var movieCompany: String = ""
    
    var moviePrice: String = ""
    var movieImage: String = ""
    var isLiked:Bool = false
    
    init(movieName:String, movieType:String, movieCompany:String,  moviePrice:String, movieImage:String) {
        
        self.movieName = movieName
        self.movieType = movieType
        self.movieCompany = movieCompany        
        self.moviePrice = moviePrice
        self.movieImage = movieImage
    }
    
}
