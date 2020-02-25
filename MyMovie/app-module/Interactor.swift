//
//  Interactor.swift
//  MyMovie
//
//  Created by tar on 25/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//
protocol InputInteractor{
    func getTest()
    func getFruitList()
}
protocol OutputInteractor {
    func ViewDidFetch(text:String)
    func FruitListDidFetch(fruitList: [Fruit])
    
}

class Interactor:InputInteractor {

    
    var presenter:OutputInteractor?
    
    func getFruitList() {
        presenter?.FruitListDidFetch(fruitList: getAllFruitDetail())
    }
    func getTest(){
        presenter?.ViewDidFetch(text: "Hello VIPER")
    }
    
    
    func getAllFruitDetail() -> [Fruit] {
        var fruitList = [Fruit]()
        let allFruitDetail = Common.generateDataList()
        for item in allFruitDetail {
            fruitList.append(Fruit(attributes: item))
        }
        return fruitList
    }
}
