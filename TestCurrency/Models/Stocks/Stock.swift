//
//  Stock.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 08/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Gloss


class Stock: JSONDecodable {
    
    let name: String
    let volume: Int
    let price: Price
    
    required init?(json: JSON) {
        self.name = ("name" <~~ json)!
        self.volume = ("volume" <~~ json)!
        self.price = ("price" <~~ json)!
    }
    

}

class Price: JSONDecodable {
    
    let amountStr: String
    let amount: Double
    
    required init?(json: JSON) {
        self.amount = ("amount" <~~ json)!
        self.amountStr = String(format: "%.2f", self.amount)
    }
}
