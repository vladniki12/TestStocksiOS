//
//  NetworkService.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 08/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import Alamofire
import Gloss


protocol NetworkServiceProtocol {
    func updateCurrency(onSucces:@escaping (Stocks)-> Void, onFail:@escaping ()->Void)
}
class NetworkService: NetworkServiceProtocol {
    
    
    func updateCurrency(onSucces:@escaping (Stocks)-> Void, onFail: @escaping ()->Void) {
        
        Alamofire.request("http://phisix-api3.appspot.com/stocks.json").responseJSON { response in                       //
            
            if let json = response.result.value {
                
                
                onSucces(Stocks(json: json as! JSON)!)
            }
            
            onFail()
        }
        
    }
}
