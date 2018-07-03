//
//  CommonViewController.swift
//  StockDemo
//
//  Created by nemichand on 7/2/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

class CommonViewController: UIViewController {

     override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNavigationBar()
    {
    self.navigationController?.navigationBar.backgroundColor=UtilityMethods.colorFromhexString(hex:"#4286f4")
    self.title = AppStringTitles.NavbarTitle
   
    }

}
