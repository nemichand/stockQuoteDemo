//
//  customHeaderCellTableViewCell.swift
//  StockDemo
//
//  Created by nemichand on 7/4/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

class customHeaderCellTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK:Setter Method
    func configureUI()
        
    {
   
    let stockSymbol:UILabel=UILabel.newAutoLayout()
    stockSymbol.text="Symbols"
    self.contentView.addSubview(stockSymbol)
    stockSymbol.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
    stockSymbol.autoPinEdge(toSuperviewEdge: .top, withInset:0)
    stockSymbol.autoSetDimensions(to: CGSize(width:140, height: self.contentView.frame.height))
    let stockPrice:UILabel=UILabel.newAutoLayout()
    stockPrice.text="Price"
    self.contentView.addSubview(stockPrice)
    stockPrice.autoPinEdge(.left, to: .right, of: stockSymbol, withOffset: 0)
    stockPrice.autoPinEdge(toSuperviewEdge: .top, withInset:0)
    stockPrice.autoSetDimensions(to: CGSize(width:200, height: self.contentView.frame.height))
    }
}
