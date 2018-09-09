//
//  StocksViewController.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 07/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class StocksViewController: UIViewController {
    func reloadTable(stocks: Stocks) {
        hideLoader()
        self.stocks = stocks
        self.tableView.reloadData()
    }
    

    @IBOutlet weak var tableView: UITableView!
    var presenter: StocksPresenter!
    let configurator: StocksConfiguratorProtocol = StocksConfigurator()
    
    @IBOutlet weak var mTextLabel: UILabel!
    
    var stocks:Stocks? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure( viewController: self)
        presenter.configureView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        showLoader()
        presenter.updatStocks()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func updateStocks(_ sender: Any) {
        
        showLoader()
        self.presenter.updatStocks()
        
    }
    
    func show(text: String) {
        mTextLabel.text = text
    }
    
}


extension StocksViewController: StocksViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks == nil ? 0 : stocks!.stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell: TableCellTableViewCell = Bundle.main.loadNibNamed("TableCellTableViewCell", owner: self, options: nil)?.last as! TableCellTableViewCell
        //let cell: TableCellTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableCellTableViewCell
        cell.setup(stock: (stocks?.stocks[indexPath.row])!)
        
        return cell
    }
    
    
    
    
    
    
}

extension Loadable where Self: UIViewController {
    
    
    
    func showLoader() {
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(type: .lineScale), NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
    }

    
    func hideLoader() {
    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(NVActivityIndicatorView.DEFAULT_FADE_OUT_ANIMATION)

    }
}
