//
//  StocksPresenter.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 07/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//


import Foundation

protocol StocksPresenterProtocol {
    func configureView()
    func reloadStocks(stocks: Stocks)
}

class StocksPresenter: StocksPresenterProtocol  {
   
    
   
    var view: StocksViewProtocol!
    var interactor: StocksInteractorProtocol!
    var router: StocksRouterProtocol!
    
    required init(view: StocksViewProtocol) {
        self.view = view
        initTimer()
    }
    func configureView() {
        
    }
    
    func updatStocks() {
        interactor.updateStocks()
    }
    
    
    func reloadStocks(stocks: Stocks) {
        self.view.reloadTable(stocks: stocks)
    }
    
    
    
    func setText(text: String) {
        view.show(text: text)
    }
    
    func initTimer(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.view.showLoader()
            self.updatStocks()
            self.initTimer()
        }
    }
    
    
}
