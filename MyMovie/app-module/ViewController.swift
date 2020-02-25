//
//  ViewController.swift
//  MyMovie
//
//  Created by tar on 21/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//

import UIKit
protocol ViewProtocol {
//    func SetText(text:String)
    func showText(text:String)
    func showFruits(with fruits: [Fruit])
}
class ViewController: UIViewController,ViewProtocol {


    var fruitList = [Fruit]()


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var helloLabel: UILabel!
    
    let animalArray = ["Cat","Dog","Snake","Spider","Hourse","Mouse"]
    var presenter:PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
//        helloLabel.text = "tar"
        presenter?.loadText()
        presenter?.viewDidLoad()
        
    }
    func setup(){
        let view = self
        let interactor = Interactor()
        let presenter = Presenter()
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
    }
    func showFruits(with fruits: [Fruit]) {
        fruitList = fruits
        tableView.reloadData()
    }
    
    func showText(text: String) {
        helloLabel.text = text
    }
    

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        let fruit = fruitList[indexPath.row]
        cell.title!.text = fruit.name
        cell.detail!.text = fruit.vitamin
        
        return cell
    }
    
    
}
