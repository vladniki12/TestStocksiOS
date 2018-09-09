//
//  StocksRouter.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 08/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Foundation

protocol StocksRouterProtocol {
    
}

class StocksRouter: StocksRouterProtocol {
    
    weak var viewController: StocksViewController!
    
    required init(viewController: StocksViewController) {
        self.viewController = viewController
    }
}
