//
//  ViewController.swift
//  StockDemo
//
//  Created by nemichand on 7/1/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetStockApiDelegate {
   
    
    
    

    //MARK: VariableDeclaration
      var didSetupConstraints:Bool;
     var stockQuoteNames:NSMutableArray=NSMutableArray()
     // MARK: View Methods
    override func loadView()
    {
        super.loadView();
        view = UIView();
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
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        didSetupConstraints=false
        super.init(coder: aDecoder)
    }
    
   
 
    
    // MARK: Memory  warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
       // MARK: Getter  Methods
    let homeTableview:UITableView =
    {
        let homeTableview = UITableView.newAutoLayout()
        homeTableview.register(UITableViewCell.self, forCellReuseIdentifier: "hometablviewCell")
       
        return homeTableview;
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
        return self.stockQuoteNames.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.homeTableview.dequeueReusableCell(withIdentifier:"hometablviewCell") as UITableViewCell?)!
        
        // set the text from the data model
       
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
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
        
        
        
        
        
    }
    
    func didGetStockApiFailed(Error: NSError)
    {
        
    }
}

