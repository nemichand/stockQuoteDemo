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
        
             setup()
    }
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK:Setter Method
    func setup()
    {
        contentView.addSubview(BackgroundImageonCell)
        self.setconstraintforbackgroundContent()
       
        
    }
       // MARK:Getter Method
    let BackgroundImageonCell:UIImageView =
    {
        let BackgroundImageonCell=UIImageView.newAutoLayout()
        BackgroundImageonCell.image = UIImage(named: "BackgroundCell.png")
        return BackgroundImageonCell;
    }()
       // MARK:setConstraints
    func setconstraintforbackgroundContent()
    {
        BackgroundImageonCell.autoPinEdgesToSuperviewEdges()
    }

}
