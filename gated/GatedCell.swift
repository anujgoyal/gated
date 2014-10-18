//
//  GatedCell.swift
//  gated
//
//  Created by Anuj Goyal on 10/16/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class GatedCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
