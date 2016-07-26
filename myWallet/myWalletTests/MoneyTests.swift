//
//  MoneyTests.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 25/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import XCTest

class MoneyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
 
    func testCurrencies() {
        
        XCTAssertEqual("EUR", Money.euroWith(amount: 1).currency)
        XCTAssertEqual("USD", Money.dollarWith(amount: 1).currency)

    }
    
    func testMultiplication() {
        
        let euro = Money.euroWith(amount: 5)
        let ten = Money.euroWith(amount: 10)
        let totalEuros = euro.times(2)
        
        XCTAssertEqual(totalEuros, ten)
        
        let dollar = Money.euroWith(amount: 10)
        let twenty = Money.euroWith(amount: 20)
        let totalDollars = dollar.times(2)
        
        XCTAssertEqual(totalDollars, twenty)
   
    }
    
    func testSimpleAddition() {
        
        let sum = Money.dollarWith(amount: 5).plus(Money.dollarWith(amount: 5))
        
        XCTAssertEqual(sum, Money.dollarWith(amount: 10))
    }
    
    func testEquality(){
        
        let five = Money.euroWith(amount: 5)
        let tenEuro = Money.euroWith(amount: 10)
        let total = five.times(2)
        
        let tenDollar = Money.dollarWith(amount: 10)
        
        XCTAssertEqual(tenEuro, total)
        XCTAssertNotEqual(tenEuro, five)
        
        XCTAssertNotEqual(tenEuro, tenDollar)
    }
    
    func testHash() {
        
        let a = Money.euroWith(amount: 2)
        let b = Money.euroWith(amount: 2)
        
        XCTAssertEqual(a.hashValue, b.hashValue)
        
        let c = Money.dollarWith(amount: 2)
        let d = Money.dollarWith(amount: 2)
        
        XCTAssertEqual(c.hashValue, d.hashValue)
        
        XCTAssertNotEqual(a, c)
    }
    
    func testDescription() {
        
        let dollar = Money.dollarWith(amount: 5)
        let ten = Money.dollarWith(amount: 10)
        let euro = Money.euroWith(amount: 5)
        
        XCTAssertEqual(ten.description, "<Money: 10.0 USD>")
        XCTAssertNotEqual(dollar.description, ten.description)
        XCTAssertNotEqual(dollar.description, euro.description)
    }
    
}
