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
        let urlString:String = requestString.getStockUrl
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
        service.resultList=successResponse
        
        if(service.resultList.count>0)
        {
            let ResultAAPLdict:NSDictionary =  service.resultList.value(forKey: "AAPL") as! NSDictionary
            let ResultApplQuoteDict:NSDictionary=ResultAAPLdict.value(forKey: "quote") as! NSDictionary
             service.stockSymbol.add(ResultApplQuoteDict.value(forKey: "symbol") as Any)
             service.stockPrice.add(ResultApplQuoteDict.value(forKey: "latestPrice") as Any)
             service.stockLowPrice.add(ResultApplQuoteDict.value(forKey: "low") as Any)
             service.stockHighPrice.add(ResultApplQuoteDict.value(forKey: "high") as Any)
             service.stockcompanyName.add(ResultApplQuoteDict.value(forKey: "companyName") as Any)
            service.stockavgTotalVolume.add(ResultApplQuoteDict.value(forKey: "avgTotalVolume") as Any)
            
            let ResultMSFTdict:NSDictionary =  service.resultList.value(forKey: "MSFT") as! NSDictionary
             let ResultMSFTQuoteDict:NSDictionary=ResultMSFTdict.value(forKey: "quote") as! NSDictionary
            service.stockSymbol.add(ResultMSFTQuoteDict.value(forKey: "symbol") as Any)
            service.stockPrice.add(ResultMSFTQuoteDict.value(forKey: "latestPrice") as Any)
            service.stockLowPrice.add(ResultMSFTQuoteDict.value(forKey: "low") as Any)
            service.stockHighPrice.add(ResultMSFTQuoteDict.value(forKey: "high") as Any)
            service.stockcompanyName.add(ResultMSFTQuoteDict.value(forKey: "companyName") as Any)
            service.stockavgTotalVolume.add(ResultMSFTQuoteDict.value(forKey: "avgTotalVolume") as Any)
            
            let ResulAMGNtdict:NSDictionary =  service.resultList.value(forKey: "AMGN") as! NSDictionary
             let ResulAMGNQuoteDict:NSDictionary=ResulAMGNtdict.value(forKey: "quote") as! NSDictionary
            service.stockSymbol.add(ResulAMGNQuoteDict.value(forKey: "symbol") as Any)
            service.stockPrice.add(ResulAMGNQuoteDict.value(forKey: "latestPrice") as Any)
            service.stockLowPrice.add(ResulAMGNQuoteDict.value(forKey: "low") as Any)
            service.stockHighPrice.add(ResulAMGNQuoteDict.value(forKey: "high") as Any)
            service.stockcompanyName.add(ResulAMGNQuoteDict.value(forKey: "companyName") as Any)
            service.stockavgTotalVolume.add(ResulAMGNQuoteDict.value(forKey: "avgTotalVolume") as Any)
            
            let ResultAMZNdict:NSDictionary =  service.resultList.value(forKey: "AMZN") as! NSDictionary
             let ResultAMZNQuoteDict:NSDictionary=ResultAMZNdict.value(forKey: "quote") as! NSDictionary
            service.stockSymbol.add(ResultAMZNQuoteDict.value(forKey: "symbol") as Any)
            service.stockPrice.add(ResultAMZNQuoteDict.value(forKey: "latestPrice") as Any)
            service.stockLowPrice.add(ResultAMZNQuoteDict.value(forKey: "low") as Any)
            service.stockHighPrice.add(ResultAMZNQuoteDict.value(forKey: "high") as Any)
            service.stockcompanyName.add(ResultAMZNQuoteDict.value(forKey: "companyName") as Any)
            service.stockavgTotalVolume.add(ResultAMZNQuoteDict.value(forKey: "avgTotalVolume") as Any)
            
            let ResultGOOGdict:NSDictionary =  service.resultList.value(forKey: "GOOG") as! NSDictionary
            let ResultGOOGQuoteDict:NSDictionary=ResultGOOGdict.value(forKey: "quote") as! NSDictionary
            service.stockSymbol.add(ResultGOOGQuoteDict.value(forKey: "symbol") as Any)
            service.stockPrice.add(ResultGOOGQuoteDict.value(forKey: "latestPrice") as Any)
            service.stockLowPrice.add(ResultGOOGQuoteDict.value(forKey: "low") as Any)
            service.stockHighPrice.add(ResultGOOGQuoteDict.value(forKey: "high") as Any)
            service.stockcompanyName.add(ResultGOOGQuoteDict.value(forKey: "companyName") as Any)
            service.stockavgTotalVolume.add(ResultGOOGQuoteDict.value(forKey: "avgTotalVolume") as Any)
            
            let ResultCSCOdict:NSDictionary =  service.resultList.value(forKey: "CSCO") as! NSDictionary
             let ResultCSCOQuoteDict:NSDictionary=ResultCSCOdict.value(forKey: "quote") as! NSDictionary
            service.stockSymbol.add(ResultCSCOQuoteDict.value(forKey: "symbol") as Any)
            service.stockPrice.add(ResultCSCOQuoteDict.value(forKey: "latestPrice") as Any)
            service.stockLowPrice.add(ResultCSCOQuoteDict.value(forKey: "low") as Any)
            service.stockHighPrice.add(ResultCSCOQuoteDict.value(forKey: "high") as Any)
            service.stockcompanyName.add(ResultCSCOQuoteDict.value(forKey: "companyName") as Any)
            service.stockavgTotalVolume.add(ResultCSCOQuoteDict.value(forKey: "avgTotalVolume") as Any)
       
            GetStockDelegate?.didGetStockApiSuccess(SuccessResponse: service);
        }
        else
        {
            GetStockDelegate?.didGetStockApiSuccess(SuccessResponse: service);
        }
        GetStockDelegate?.didGetStockApiSuccess(SuccessResponse: service);
    }
   
    
    

}
