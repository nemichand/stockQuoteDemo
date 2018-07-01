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
   
    var resultList:NSArray
    var introDict:NSDictionary
    var id:String
    var title:String
    var subtitle:String
    var imageUrl:String
    var sequence:String
   
    override init()
    {
        id=String()
        title=String()
        subtitle=String()
        imageUrl=String()
        sequence=String()
        resultList=NSMutableArray()
        introDict=NSDictionary()
    }
    
    
    
    
}
