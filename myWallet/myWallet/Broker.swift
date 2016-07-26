//
//  Broker.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 25/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import Foundation

class Broker {
    
    init(){}
    
    private var rates = [String : Double]()
    
    func reduce(money: Money, toCurrency currency: String) -> Money? {
        
        if money.currency == currency {
            
            return money
        }
        
        let rateKey = key(money.currency, toCurrency: currency)
        
        guard let rate = rates[rateKey] else {
            
            return nil
        }
        
        return Money(amount: money.amount * rate, currency: currency)
    }
    
    func addRate(rate: Double, fromCurrency c1: String, toCurrency c2: String) {
        
        let rateKey = key(c1, toCurrency: c2)
        
        rates[rateKey] = rate
        
        let inverseRateKey = key(c2, toCurrency: c1)
        
        rates[inverseRateKey] = 1 / rate
    }
    
    
    func key(fromCurrency: String, toCurrency: String) -> String {
        
        return fromCurrency + "-" + toCurrency
    }
}
