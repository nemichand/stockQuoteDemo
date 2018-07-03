//
//  HomeVCCustomCell.swift
//  StockDemo
//
//  Created by nemichand on 7/1/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit
import PureLayout
class HomeVCCustomCell: UITableViewCell {

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
        contentView.addSubview(BackgroundImageonCell)
        self.setconstraintforbackgroundContent()
        contentView.addSubview(StockSymbolLabel)
        self.setconstraintforStockSymbolLabel()
        contentView.addSubview(StockPriceLabel)
        self.setconstraintforStockPriceLabel()
       
        
    }
       // MARK:Getter Method
    let BackgroundImageonCell:UIImageView =
    {
        let BackgroundImageonCell=UIImageView.newAutoLayout()
        BackgroundImageonCell.image = UIImage(named: "BackgroundCell.png")
        return BackgroundImageonCell;
    }()
    
    let StockSymbolLabel:UILabel =
    {
        let StockSymbolLabel = UILabel.newAutoLayout()
        StockSymbolLabel.textAlignment = NSTextAlignment.center
        return StockSymbolLabel
    }()
    let StockPriceLabel:UILabel =
    {
        let StockPriceLabel = UILabel.newAutoLayout()
        StockPriceLabel.textAlignment = NSTextAlignment.center
      
        return StockPriceLabel
    }()
    // MARK:setConstraints
    func setconstraintforbackgroundContent()
    {
        BackgroundImageonCell.autoPinEdgesToSuperviewEdges()
    }

    func setconstraintforStockSymbolLabel()
    {
        StockSymbolLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        StockSymbolLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        StockSymbolLabel.autoSetDimensions(to:CGSize(width:100, height: self.contentView.frame.size.height))
        
    }
    func setconstraintforStockPriceLabel()
    {
        StockPriceLabel.autoPinEdge(.left, to: .right, of: StockSymbolLabel, withOffset: 20)
        StockPriceLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        StockPriceLabel.autoSetDimensions(to:CGSize(width:100, height: self.contentView.frame.size.height))
    }
}
