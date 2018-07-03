//
//  introResponse.swift
//  UrbanApp
//
//  Created by nemichand on 4/3/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

class GetStockResponse: NSObject
{
   
    var resultList:NSDictionary
    var stockSymbol:NSMutableArray
    var stockPrice:NSMutableArray
    var stockHighPrice:NSMutableArray
    var stockLowPrice:NSMutableArray
    var stockcompanyName:NSMutableArray
    var stockavgTotalVolume:NSMutableArray
    override init()
    {
        
        resultList=NSDictionary()
        stockSymbol=NSMutableArray()
        stockPrice=NSMutableArray()
        stockHighPrice=NSMutableArray()
        stockLowPrice=NSMutableArray()
        stockcompanyName=NSMutableArray()
        stockavgTotalVolume=NSMutableArray()
        
    }
    
    
    
    
}
