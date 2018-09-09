//
//  StocksConfigurator.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 07/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import Foundation

protocol StocksConfiguratorProtocol {
    func configure(viewController: StocksViewController)
}

class StocksConfigurator:StocksConfiguratorProtocol  {
    
    func configure(viewController: StocksViewController) {
        let presenter = StocksPresenter(view: viewController)
        let interactor = StocksInteractor(presenter: presenter)
        let router = StocksRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
