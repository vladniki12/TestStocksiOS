//
//  Stocks.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 08/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import Gloss

class Stocks: JSONDecodable {
    
    let stocks:[Stock]
    
    
    required init?(json: JSON) {
        self.stocks = ("stock" <~~ json)!
    }
    

}
