//
//  ViewController.swift
//  MyMovie
//
//  Created by tar on 21/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buyTicBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.register(UINib.init(nibName: "DataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "dataIdentifierB")
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width:UIScreen.main.bounds.size.width - 250.0,height:collectionView.frame.size.height - 30.0)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.9
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 50.0)
        collectionView.collectionViewLayout = floawLayout
   
        
    }
    


}

extension MovieViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataIdentifierB", for: indexPath) as! DataCollectionViewCell
//        cell.lblTitle.text = "Title - \(indexPath.row + 1)"
//        cell.lblSubTitle.text = "SubTitle - \(indexPath.row + 1)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected == \(indexPath.row)")
    }
    
}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
