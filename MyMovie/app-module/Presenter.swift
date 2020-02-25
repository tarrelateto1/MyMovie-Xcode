//
//  Presenter.swift
//  MyMovie
//
//  Created by tar on 25/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//
protocol PresenterProtocol{
    var view: ViewProtocol? {get set}
    var interactor: InputInteractor? {get set}
    func loadText()
    func viewDidLoad()

}
class Presenter:PresenterProtocol {
    func viewDidLoad() {
        interactor?.getFruitList()
    }
    
    var view: ViewProtocol?
    var interactor:InputInteractor?
    
    func loadText(){
        interactor?.getTest()
    }
}

extension Presenter:OutputInteractor{
    func FruitListDidFetch(fruitList: [Fruit]) {
        view?.showFruits(with: fruitList)

    }
    
    func ViewDidFetch(text:String){
        view?.showText(text: text)
    }
}
