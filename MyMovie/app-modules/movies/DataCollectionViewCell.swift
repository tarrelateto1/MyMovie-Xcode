//
//  DataCollectionViewCell.swift
//  MyMovie
//
//  Created by tar on 9/3/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cntView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.cntView.layer.shadowColor = UIColor.gray.cgColor
            self.cntView.layer.shadowOpacity = 0.5
            self.cntView.layer.shadowOpacity = 10.5
            self.cntView.layer.shadowOffset = .zero
            self.cntView.layer.shadowPath = UIBezierPath(rect:self.cntView.bounds).cgPath
            self.cntView.layer.shouldRasterize = true
            
        }
    }

}
