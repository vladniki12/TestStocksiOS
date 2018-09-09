//
//  StocksInteractor.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 08/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Foundation

protocol StocksInteractorProtocol {
    func updateStocks()
}

class StocksInteractor: StocksInteractorProtocol {

    weak var presenter: StocksPresenter!
    let serviceNetwork: NetworkServiceProtocol = NetworkService()
    
    required init(presenter: StocksPresenter) {
        self.presenter = presenter
    }
    
    func updateStocks() {
        serviceNetwork.updateCurrency(onSucces: { (result) in
            self.presenter.reloadStocks(stocks: result)
        }) {
            
        }
    }
    
    
}
