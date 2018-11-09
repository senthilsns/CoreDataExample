//
//  UserDetailCell.swift
//  CoreDataExample
//
//  Created by SENTHIL on 09/11/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class UserDetailCell: UITableViewCell {

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
