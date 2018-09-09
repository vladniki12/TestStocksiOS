//
//  StocksViewProtocol.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 07/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Foundation

protocol StocksViewProtocol: Loadable {
    
    func show(text: String)
    func reloadTable(stocks: Stocks)
}
