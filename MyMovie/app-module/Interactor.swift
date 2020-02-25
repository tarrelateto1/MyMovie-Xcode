//
//  Interactor.swift
//  MyMovie
//
//  Created by tar on 25/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//
protocol InputInteractor{
    func getTest()
}
protocol OutputInteractor {
    func ViewDidFetch(text:String)
    
}

class Interactor:InputInteractor {
    var presenter:OutputInteractor?
    
    
    func getTest(){
        presenter?.ViewDidFetch(text: "Hello VIPER")
    }
}
