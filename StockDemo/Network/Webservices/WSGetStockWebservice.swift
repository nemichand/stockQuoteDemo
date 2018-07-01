//
//  WSIntroWebservice.swift
//  UrbanApp
//
//  Created by nemichand on 4/3/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit

protocol GetStockApiDelegate
{
    func didGetStockApiSuccess(SuccessResponse:GetStockResponse)
    func didGetStockApiFailed(Error:NSError)
}
class WSGetStockWebservice: NSObject,WebserviceOperationProtocol {
   
    
    var GetStockDelegate:GetStockApiDelegate?
    var getrequestinstance:GetStockRequest
    required override init()
    {
        getrequestinstance=GetStockRequest()
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func GetStockApiByRequest(requestString:GetStockRequest)
    {
        let urlString:String = getrequestinstance.getStockUrl
        let service:WSWebserviceOperation = WSWebserviceOperation()
        service.delegateWebserviceOperation=self
        service.callWebserviceByRequestString(requestString: urlString as String)
     }
    
    
    func didResponseFailed(Error: NSError)
    {
         print(Error)
        
        GetStockDelegate?.didGetStockApiFailed(Error: Error as NSError)
    }
    
    func didResponseSuccess(successResponse: NSDictionary)
    {
        
       let service:GetStockResponse = GetStockResponse()
       service.resultList=successResponse.object(forKey: "data") as! NSArray
        
        if( service.resultList.count>0)
        {
            GetStockDelegate?.didGetStockApiSuccess(SuccessResponse: service);
        }
        else
        {
            GetStockDelegate?.didGetStockApiSuccess(SuccessResponse: service);
        }
        GetStockDelegate?.didGetStockApiSuccess(SuccessResponse: service);
    }
   
    
    

}
