//
//  TableCell.swift
//  MyMovie
//
//  Created by tar on 23/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
