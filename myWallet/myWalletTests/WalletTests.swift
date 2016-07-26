//
//  WalletTests.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 25/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import XCTest

class WalletTests: XCTestCase {


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // €40 + $20 = $100 2:1
    func testAdditionWithReduction() {
        
        let broker = Broker()
        
        broker.addRate(2, fromCurrency:"EUR", toCurrency:"USD")
        
        let wallet = Wallet(broker: broker)
        
        let euro = Money.euroWith(amount: 40)
        let dollar = Money.dollarWith(amount: 20)
        
        wallet.add(money: euro)
        wallet.add(money: dollar)
 
        
        let reduced = wallet.total()
        
        XCTAssertEqual(reduced, Money.dollarWith(amount: 100))
    }
    
    func testAddMoney() {
        
        let wallet = Wallet()
        
        let euro = Money.euroWith(amount: 5)
        
        wallet.add(money: euro)
        
        XCTAssertEqual(wallet.dict[euro.currency]!.count, 1)
        XCTAssertEqual(wallet.currencies.count, 1)
    }
    
    func testTakeMoney() {
        
//        let wallet = Wallet()
//        
//        let euro = Money.euroWith(amount: 10)
//        
//        wallet.add(money: euro)
//        
//        wallet.moneyAt(indexPath: NSIndexPath(forRow: <#T##Int#>, inSection: <#T##Int#>)
//        
//        XCTAssertEqual(wallet.dict[euro.currency]!.count, 0)
//        XCTAssertEqual(wallet.currencies.count, 0)
    }
    
    func testCurrenciesCount() {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        let dollar2 = Money.dollarWith(amount: 2)
        
        wallet.add(money: euro1)
        wallet.add(money: euro2)
        wallet.add(money: dollar1)
        wallet.add(money: dollar2)
        
        XCTAssertEqual(wallet.currencies.count, 2)

        
    }
    
    func testCurrencyMoneyCount() {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        
        wallet.add(money: euro1)
        wallet.add(money: euro2)
        wallet.add(money: dollar1)
        
        let count = wallet.moneyCountFor(currency: "EUR")
        
        XCTAssertEqual(count, 2)
        
    }
    
    func testMoneysForCurrency()  {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        
        wallet.add(money: euro1)
        wallet.add(money: euro2)
        wallet.add(money: dollar1)
    
    }
    
    func testOrderMoneysArray() {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        let dollar2 = Money.dollarWith(amount: 2)
        
        wallet.add(money: dollar1)
        wallet.add(money: euro2)
        wallet.add(money: dollar2)
        wallet.add(money: euro1)

        
        XCTAssertEqual(wallet.moneyAt(indexPath: NSIndexPath(forRow: 0, inSection: 0)), euro1)
        
    }
    
    func testSectionName()  {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        let dollar2 = Money.dollarWith(amount: 2)
        
        wallet.add(money: dollar1)
        wallet.add(money: euro2)
        wallet.add(money: dollar2)
        wallet.add(money: euro1)
        
        let name = wallet.sectionNameAt(index: 1)
        
        XCTAssertEqual(name, "DOLARES")
    }
    
    func testNumberOfSectionsInWallet() {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        let dollar2 = Money.dollarWith(amount: 2)
        
        wallet.add(money: dollar1)
        wallet.add(money: euro2)
        wallet.add(money: dollar2)
        wallet.add(money: euro1)
        
        XCTAssertEqual(wallet.sectionsCount, 3)
        
    }
    
    func testNumberOfRowsInWalletSection() {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        let dollar2 = Money.dollarWith(amount: 2)
        
        wallet.add(money: dollar1)
        wallet.add(money: euro2)
        wallet.add(money: dollar2)
        wallet.add(money: euro1)
        
        XCTAssertEqual(wallet.rowsInSection(0), 3)
        XCTAssertEqual(wallet.rowsInSection(2), 1)
        
    }
    
    func testMoneyAtIndexPath() {
        
        let wallet = Wallet()
        
        let euro1 = Money.euroWith(amount: 5)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 1)
        let dollar2 = Money.dollarWith(amount: 2)
        
        wallet.add(money: dollar1)
        wallet.add(money: euro2)
        wallet.add(money: dollar2)
        wallet.add(money: euro1)
        
        let indexPath = NSIndexPath(forRow: 1, inSection: 0)
        
        let money = wallet.moneyAt(indexPath: indexPath)
        
        XCTAssertEqual(money, euro2)
        
    }
    


}
