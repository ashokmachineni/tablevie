//
//  TableViewCell.swift
//  BBTJson
//
//  Created by Ashok Machineni on 10/26/16.
//  Copyright © 2016 Ashok Machineni. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var actorPicture: UIImageView!
    @IBOutlet var actorCountry: UILabel!
    @IBOutlet var actorName: UILabel!
   
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    
}
