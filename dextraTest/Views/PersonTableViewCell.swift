//
//  PersonTableViewCell.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/18/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    //Creating outlets
    @IBOutlet weak var repoCountLabel: UILabel!     //Label refers to the user's amount of repositories
    @IBOutlet weak var personImage: UIImageView!    //Image view refers to the user's picture
    @IBOutlet weak var personNameLabel: UILabel!    //Label refers to the user's name
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
