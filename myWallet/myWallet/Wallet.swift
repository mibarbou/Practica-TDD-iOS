//
//  Wallet.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 25/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import Foundation

typealias MoneyDictionary = [String :[Money]]

class Wallet  {
    
    var dict = MoneyDictionary()
    var currencies = Set<String>()
    
    var broker = Broker()
    
    var sectionsCount : Int{
    get{
        let count = self.currencies.count + 1
        return count
        }
    }
    
    init(){}
    
    init(broker: Broker){
        
        self.broker = broker
        
    }
    
    func add(money money: Money)  {
        
        if currencies.contains(money.currency) {
        
            if var moneys = dict[money.currency] {
                
                moneys.append(money)
                
                moneys = orderMoneys(moneys)
                
                dict[money.currency] = moneys

            }
            
        } else {
        
            currencies.insert(money.currency)
            
            dict[money.currency] = [money]
        
        }
    
    }
    
    
    func moneyAt(indexPath indexPath : NSIndexPath) -> Money {
        
        let currenciesArray = Array(currencies).sort { $0 < $1 }

        let currency = currenciesArray[indexPath.section]
        
        let moneys = dict[currency]!
        
        if indexPath.section == currenciesArray.count {
            // es la seccion TOTAL
            return total()
            
        } else if indexPath.row == moneys.count{
            // es la seccion SUBTotal
            return reduceTo(currency: currency, broker: broker)

        }
        
        return moneys[indexPath.row]
    }
    
    func rowsInSection(index: Int) -> Int {
        
        let currenciesArray = Array(currencies).sort { $0 < $1 }
                
        if index == currenciesArray.count {
        
            return 1
        }
        
        return moneyCountFor(currency: currenciesArray[index]) + 1
    }
    
    func moneyCountFor(currency currency: String) -> Int {
        
        guard let moneys = dict[currency] else {
            
            return 0
        }
        
        return moneys.count

    }
    
    func reduceTo(currency currency: String, broker: Broker) -> Money {
        
        var total = Money.dollarWith(amount: 0)
        
        for money in dict[currency]! {
        
            guard let reduce = broker.reduce(money, toCurrency: "USD") else {
                break
            }
            
            total = total.plus(reduce)
        }

        return total
    }
    
    func total() -> Money {
        
        var total = Money.dollarWith(amount: 0)

        for currency in currencies {
            
           let subtotal = reduceTo(currency: currency, broker: broker)
            
           total = total.plus(subtotal)
        }
        
        return total
    }
    
    //MARK: Helpers
    
    func orderMoneys(moneys: [Money]) -> [Money] {
        
        
        return moneys.sort{ $0.currency == $1.currency ? $0.amount < $1.amount : $0.currency < $1.currency }
    }
    
}
