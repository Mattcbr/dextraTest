//
//  DetailTableViewCell.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/19/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel! // Label refering to the repository's name
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
