//
//  ViewController.swift
//  StockDemo
//
//  Created by nemichand on 7/1/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

class ViewController:CommonViewController ,UITableViewDelegate,UITableViewDataSource,GetStockApiDelegate {
   
    
    
    

    //MARK: VariableDeclaration
      var didSetupConstraints=false;
    var stockSymbol:NSMutableArray=NSMutableArray()
    var stockPrice:NSMutableArray=NSMutableArray()
    var stockHighPrice:NSMutableArray=NSMutableArray()
    var stockLowPrice:NSMutableArray=NSMutableArray()
    var stockcompanyName:NSMutableArray=NSMutableArray()
    var stockavgTotalVolume:NSMutableArray=NSMutableArray()
    var stockheader:NSMutableArray=NSMutableArray()
     // MARK: View Methods
    override func loadView()
    {
        super.loadView();
        view = UIView();
        self.addNavigationBar()
        homeTableview.dataSource = self
        homeTableview.delegate = self
        view.addSubview(homeTableview);
        self.updateViewConstraints()
        self.callGetstockAPI();
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    // MARK: Memory  warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
       // MARK: Getter  Methods
   
    let homeTableview: UITableView =
    {
     
        let  homeTableview:UITableView = UITableView.newAutoLayout()
        homeTableview.register(HomeVCCustomCell.self, forCellReuseIdentifier: "tableCell")
         homeTableview.register(customHeaderCellTableViewCell.self, forCellReuseIdentifier: "headertableCell")
        homeTableview.separatorColor=UIColor.clear
        
        return homeTableview
    }()
   
    // MARK: Set Constraints
    override func updateViewConstraints()
    {
        
        if (!didSetupConstraints)
        {
            
            homeTableview.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0, 0, 0, 0))
         
        
        didSetupConstraints = true
    }
    super.updateViewConstraints()
}
   
     // MARK: tablview Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockSymbol.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableview
            .dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! HomeVCCustomCell
        cell.StockSymbolLabel.text=stockSymbol[indexPath.row] as? String
        let formatter : NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let str = formatter.string(from: stockPrice[indexPath.row] as! NSNumber)!
        cell.StockPriceLabel.text=str
       

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(DeviceType.IS_IPAD)
        {
            return 70
        }
        else
        {
            return 50
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(DeviceType.IS_IPAD)
        {
            return 70
        }
        else
        {
            return 50
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
      
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headertableCell") as! customHeaderCellTableViewCell
        headerCell.contentView.backgroundColor=UIColor.lightText
        headerView.addSubview(headerCell)
        
        return headerView
       
 
      
    }
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailVCViewController=detailVCViewController()
        let formatter : NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
       
        DetailVCViewController.companyNameText.text=(stockcompanyName[indexPath.row] as! String)
        let strprice = formatter.string(from: stockPrice[indexPath.row] as! NSNumber)!
        DetailVCViewController.latestPriceText.text=strprice
        
        let strstockLowPrice = formatter.string(from: stockLowPrice[indexPath.row] as! NSNumber)!
        DetailVCViewController.highPriceText.text=strstockLowPrice

        let strstockHighPrice = formatter.string(from: stockHighPrice[indexPath.row] as! NSNumber)!
        DetailVCViewController.lowPriceText.text=strstockHighPrice

        let stravgTotalVolume = formatter.string(from: stockavgTotalVolume[indexPath.row] as! NSNumber)!
        DetailVCViewController.avgTotalVolumeText.text=stravgTotalVolume
     
        navigationController?.pushViewController(DetailVCViewController, animated: true)
    }
    //MARK:Call Api
    func callGetstockAPI()
    {
        if(UtilityMethods.isConnectedToNetwork())
        {
            UtilityMethods.ShowHudview(LoadView: view);
            let serviceCall:WSGetStockWebservice = WSGetStockWebservice()
            serviceCall.GetStockDelegate=self
            let request:GetStockRequest = GetStockRequest()
            request.getStockUrl=BASEURL.GETSTOCKURL;
            
            serviceCall.GetStockApiByRequest(requestString: request);
        }
        else
        {
            ShowNetWorkAlert(title: "Network", message: "Please check your internet connection and try again.")
            
        }
        
        
    }
    
    
    @objc func ShowNetWorkAlert(title:String,message:String)
    {
        let alert = UIAlertController(title:title, message:message, preferredStyle: UIAlertControllerStyle.alert)
                // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
           self.callGetstockAPI()
        }))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    func didGetStockApiSuccess(SuccessResponse: GetStockResponse)
    {
         UtilityMethods.HideHudview(LoadView: view);
        stockSymbol=SuccessResponse.stockSymbol
        stockPrice=SuccessResponse.stockPrice
        stockcompanyName=SuccessResponse.stockcompanyName
        stockLowPrice=SuccessResponse.stockLowPrice
        stockHighPrice=SuccessResponse.stockHighPrice
        stockavgTotalVolume=SuccessResponse.stockavgTotalVolume
        self.homeTableview.reloadData()
    }
    
    func didGetStockApiFailed(Error: NSError)
    { UtilityMethods.HideHudview(LoadView: view);
        print("APi Response nil")
    }
    
}

