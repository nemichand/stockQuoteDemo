//
//  StockDemoTests.swift
//  StockDemoTests
//
//  Created by nemichand on 7/1/18.
//  Copyright © 2018 nemichand. All rights reserved.
//

import XCTest
@testable import StockDemo

class StockDemoTests: XCTestCase {
    
var sessionUnderTest: URLSession!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func test_GetStockApiUrl() {
       
        let url = URL(string:BASEURL.GETSTOCKURL)
       
        let promise = expectation(description: "Status code: 200")
       
        let dataTask = sessionUnderTest.dataTask(with: url!) {  data, response, error in
           
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                    } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
     
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
