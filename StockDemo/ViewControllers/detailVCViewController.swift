//
//  detailVCViewController.swift
//  StockDemo
//
//  Created by nemichand on 7/4/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

class detailVCViewController: UIViewController {
    //MARK: VariableDeclaration
    var didSetupConstraints=false;
      // MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor=UIColor.white
        self.view.addSubview(companyNameTitle)
        self.view.addSubview(companyNameText)
        self.view.addSubview(latestPriceTitle)
        self.view.addSubview(latestPriceText)
        self.view.addSubview(lowPriceTitle)
        self.view.addSubview(lowPriceText)
        self.view.addSubview(highPriceTitle)
        self.view.addSubview(highPriceText)
        self.view.addSubview(avgTotalVolumeTitle)
        self.view.addSubview(avgTotalVolumeText)
        self.title="Stock Detail"
        self.navigationItem.backBarButtonItem?.title = ""
       self.updateViewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    let companyNameTitle: UILabel =
    {
        
        let companyNameTitle:UILabel=UILabel.newAutoLayout()
        companyNameTitle.text="Company Name"
        return companyNameTitle
    }()
    let companyNameText: UILabel =
    {
        
        let companyNameText:UILabel=UILabel.newAutoLayout()
        companyNameText.text="Symbols"
        return companyNameText
    }()
    let latestPriceTitle: UILabel =
    {
        
        let latestPriceTitle:UILabel=UILabel.newAutoLayout()
        latestPriceTitle.text="Latest Price"
        return latestPriceTitle
    }()
    let latestPriceText: UILabel =
    {
        
        let latestPriceText:UILabel=UILabel.newAutoLayout()
        latestPriceText.text="Symbols"
        return latestPriceText
    }()
    let lowPriceTitle: UILabel =
    {
        
        let lowPriceTitle:UILabel=UILabel.newAutoLayout()
        lowPriceTitle.text="Low Price"
        return lowPriceTitle
    }()
    let lowPriceText: UILabel =
    {
        
        let lowPriceText:UILabel=UILabel.newAutoLayout()
        lowPriceText.text="Symbols"
        return lowPriceText
    }()

    let highPriceTitle: UILabel =
    {
        
        let highPriceTitle:UILabel=UILabel.newAutoLayout()
        highPriceTitle.text="High Price"
        return highPriceTitle
    }()
    let highPriceText: UILabel =
    {
        
        let highPriceText:UILabel=UILabel.newAutoLayout()
        highPriceText.text="Symbols"
        return highPriceText
    }()

    let avgTotalVolumeTitle: UILabel =
    {
        
        let avgTotalVolumeTitle:UILabel=UILabel.newAutoLayout()
        avgTotalVolumeTitle.text="avgTotalVolume"
        return avgTotalVolumeTitle
    }()
    let avgTotalVolumeText: UILabel =
    {
        
        let avgTotalVolumeText:UILabel=UILabel.newAutoLayout()
        avgTotalVolumeText.text="Symbols"
        return avgTotalVolumeText
    }()

    
    
 
    // MARK: Set Constraints
    override func updateViewConstraints()
    {
        
        if (!didSetupConstraints)
        {
            
            companyNameTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            companyNameTitle.autoPinEdge(toSuperviewEdge: .top, withInset:(navigationController?.navigationBar.frame.size.height)!+10)
            companyNameTitle.autoSetDimensions(to: CGSize(width:140, height:50))
            
            companyNameText.autoPinEdge(.left, to: .right, of: companyNameTitle, withOffset: 0)
            companyNameText.autoPinEdge(toSuperviewEdge: .top, withInset:(navigationController?.navigationBar.frame.size.height)!+10)
            companyNameText.autoSetDimensions(to: CGSize(width:200, height: 50))
            
            latestPriceTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            latestPriceTitle.autoPinEdge(.top, to: .bottom, of: companyNameTitle, withOffset: 10)
            latestPriceTitle.autoSetDimensions(to: CGSize(width:140, height:50))
            
            latestPriceText.autoPinEdge(.left, to: .right, of: latestPriceTitle, withOffset: 0)
            latestPriceText.autoPinEdge(.top, to: .bottom, of: companyNameText, withOffset: 10)
            latestPriceText.autoSetDimensions(to: CGSize(width:200, height: 50))
            
            lowPriceTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            lowPriceTitle.autoPinEdge(.top, to: .bottom, of: latestPriceTitle, withOffset: 10)
            lowPriceTitle.autoSetDimensions(to: CGSize(width:140, height:50))
            
            lowPriceText.autoPinEdge(.left, to: .right, of: lowPriceTitle, withOffset: 0)
            lowPriceText.autoPinEdge(.top, to: .bottom, of: latestPriceText, withOffset: 10)
            lowPriceText.autoSetDimensions(to: CGSize(width:200, height: 50))
            
            highPriceTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            highPriceTitle.autoPinEdge(.top, to: .bottom, of: lowPriceTitle, withOffset: 10)
            highPriceTitle.autoSetDimensions(to: CGSize(width:140, height:50))
            
            highPriceText.autoPinEdge(.left, to: .right, of: highPriceTitle, withOffset: 0)
            highPriceText.autoPinEdge(.top, to: .bottom, of: lowPriceText, withOffset: 10)
            highPriceText.autoSetDimensions(to: CGSize(width:200, height: 50))
            
            avgTotalVolumeTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            avgTotalVolumeTitle.autoPinEdge(.top, to: .bottom, of: highPriceTitle, withOffset: 10)
            avgTotalVolumeTitle.autoSetDimensions(to: CGSize(width:140, height:50))
            
            avgTotalVolumeText.autoPinEdge(.left, to: .right, of: avgTotalVolumeTitle, withOffset: 0)
            avgTotalVolumeText.autoPinEdge(.top, to: .bottom, of: highPriceText, withOffset: 10)
            avgTotalVolumeText.autoSetDimensions(to: CGSize(width:200, height: 50))
            
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
   
    
}
