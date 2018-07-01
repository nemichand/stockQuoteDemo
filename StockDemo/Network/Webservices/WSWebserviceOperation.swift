//
//  WSWebserviceOperation.swift
//  UrbanApp
//
//  Created by nemichand on 4/3/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import UIKit


protocol WebserviceOperationProtocol
{
    func didResponseFailed(Error:NSError)
    func didResponseSuccess(successResponse:NSDictionary)

}
class WSWebserviceOperation: NSObject,NSURLConnectionDelegate
{
     var delegateWebserviceOperation:WebserviceOperationProtocol?

    
    func callWebserviceByRequestString(requestString:String)
    {
        let urlWithParams = requestString
        let myUrl = NSURL(string: urlWithParams);
        
        let request = NSMutableURLRequest(url:myUrl! as URL);
        
        // Set request HTTP method to GET. It could be POST as well
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            guard let data = data, error == nil
                else
            {
                print("error=\(String(describing: error))")
                return
            }
            do
            {
                
                let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
              
                let status = dictionary.value(forKey: "status") as! String
                let sts = String(status)
                DispatchQueue.main.async()
                    {
                        if sts == "ok"
                        {
                           
                            self.delegateWebserviceOperation?.didResponseSuccess(successResponse: dictionary)
                        }
                        else
                        {
                            self.delegateWebserviceOperation?.didResponseFailed(Error: error! as NSError)
                        }
                }
            }
            catch
            {
                print(error)
                self.delegateWebserviceOperation?.didResponseFailed(Error:error as NSError)
            }
            
        }
        task.resume()
    }
   
}
