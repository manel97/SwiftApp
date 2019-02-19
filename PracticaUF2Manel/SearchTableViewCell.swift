//
//  SearchTableViewCell.swift
//  PracticaUF2Manel
//
//  Created by Manel Sitjar on 06/02/2019.
//  Copyright © 2019 Manel Sitjar. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var isLiked: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
