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

}
class Presenter:PresenterProtocol {
    var view: ViewProtocol?
    var interactor:InputInteractor?
    
    func loadText(){
        interactor?.getTest()
    }
}

extension Presenter:OutputInteractor{
    func ViewDidFetch(text:String){
        view?.showText(text: text)
    }
}
