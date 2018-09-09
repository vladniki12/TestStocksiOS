//
//  TableCellTableViewCell.swift
//  TestCurrency
//
//  Created by Vladislav Novoseltsev on 08/09/2018.
//  Copyright © 2018 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var stock: Stock! = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // code common to all your cells goes here
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(stock: Stock) {
        nameLabel.text = stock.name
        volumeLabel.text = String(stock.volume)
        amountLabel.text = stock.price.amountStr
    }
    
}
