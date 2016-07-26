//
//  BrokerTests.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 25/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import XCTest

class BrokerTests: XCTestCase {
    
    var broker = Broker()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        broker = Broker()
    }
    

    func testSimpleReduction() {
        
        let money = Money.dollarWith(amount: 5).plus(Money.dollarWith(amount: 5))
        
        let reduced = broker.reduce(money, toCurrency:"USD")
        
        XCTAssertEqual(money, reduced)
    }
    
    func testReduction() {
        
        broker.addRate(2, fromCurrency:"EUR", toCurrency:"USD")
        
        let dollars = Money.dollarWith(amount: 10)
        let euros = Money.euroWith(amount: 5)
        
        let convertedEuros = broker.reduce(euros, toCurrency: "USD")
        
        XCTAssertEqual(convertedEuros!, dollars)
        
        let convertedDollars = broker.reduce(dollars, toCurrency: "EUR")
     
        XCTAssertEqual(convertedDollars!, euros)
    }
    
    func testUnknownCurrencyReduction() {
        
        let euros = Money.euroWith(amount: 5)
        let unknown = broker.reduce(euros, toCurrency: "XXX")
        
        XCTAssertNil(unknown)
    }
    
}
