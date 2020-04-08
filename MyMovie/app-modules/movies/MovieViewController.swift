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
    @IBOutlet weak var backgroundImage: UIImageView!
    var imageUrl = ["https://trapezeonline.com/wp-content/uploads/2019/10/dd3psy0-338e175b-e77f-4704-aade-a79b7a73d1c1.jpg",
    "https://i.pinimg.com/474x/48/43/71/4843716ccb9acce77e84e08f3498b9ae.jpg",
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8971ab4e-777c-4897-b797-ddc3448e6bda/dck36ee-46d1bab9-fd78-449e-97c0-bdb01afc59e3.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg5NzFhYjRlLTc3N2MtNDg5Ny1iNzk3LWRkYzM0NDhlNmJkYVwvZGNrMzZlZS00NmQxYmFiOS1mZDc4LTQ0OWUtOTdjMC1iZGIwMWFmYzU5ZTMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.zZF9Rt3FAyBnrSoOW26k1Da36JNv6hqpcBsWTvmy7KE",
    "https://honknews.com/wp-content/uploads/2020/01/22ede24a9e80bd9369fe2a872f938601.jpg"]
    
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataIdentifierB", for: indexPath) as! DataCollectionViewCell
        
        if let url = URL(string:imageUrl[indexPath.row]){
            do{
                let data = try Data(contentsOf:url)
                cell.image.image = UIImage(data:data)
            }catch let err {
                print("Error : \(err.localizedDescription)")
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected == \(indexPath.row)")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        let currentPage = Int(floor((offset - pageSide / 2)/pageSide)+1)
        if let url = URL(string:imageUrl[currentPage]){
            do{
                let data = try Data(contentsOf:url)
                setup(image:UIImage(data:data)!)
//                self.backgroundImage.image = UIImage(data:data)
            }catch let err {
                print("Error : \(err.localizedDescription)")
            }
        }

    }
    
    fileprivate var pageSize:CGSize {
        let layout = self.collectionView.collectionViewLayout as!UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal{
            pageSize.width += layout.minimumLineSpacing
        }else{
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    func setup(image:UIImage){
        UIView.transition(with: backgroundImage, duration: 0.3, options: .transitionCrossDissolve, animations:{
            self.backgroundImage.image = image
        })
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
