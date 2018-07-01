//
//  Constant.swift
//  UrbanApp
//
//  Created by nemichand on 1/1/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import Foundation
import UIKit

let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad;


struct DeviceType
{
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_RETINA = UIScreen.main.scale>=2.0;
    static let IS_IPHONE_4_OR_LESS = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH==667.0
    static let IS_IPHONE_6P = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    
}
struct APP_DELEGATE {
    static let window = UIApplication.shared.keyWindow!
    static let NavigationMain = UINavigationController.init();
}
struct ScreenSize
{
 
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH,ScreenSize.SCREEN_HEIGHT)
    
}
struct AppStringTitles {

    static let progressHudTitle = "Loading Please Wait"
    
    
}
struct BASEURL
{
     static let GETSTOCKURL = "https://api.iextrading.com/1.0/stock/market/batch?symbols=msft,AMGN,AMZN&types=quote,news,chart&range=1m&last=30"
    
}
