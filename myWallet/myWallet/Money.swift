//
//  Money.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 25/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import Foundation


class Money : Equatable {
    
    private(set) var amount : Double
    
    private(set) var currency : String
    
    var isSubTotal = false
    
    init(amount: Double, currency: String){
        
        self.amount = amount
        self.currency = currency
    }
    
    static func euroWith(amount amount: Double) -> Money {
        
        return Money(amount: amount, currency: "EUR")
    }
    
    static func dollarWith(amount amount: Double) -> Money {
        
        return Money(amount: amount, currency: "USD")
    }
    
    func times(multiplier: Double) -> Money {
        
        return Money.init(amount: amount * multiplier, currency: self.currency)
    }
    
    func plus(money: Money) -> Money {
        
        return Money(amount: self.amount + money.amount, currency: self.currency)
    }
    
    var proxyForComparison : String{
        get{
            return "\(amount)\(currency)"
        }
    }
    
}

extension Money: Hashable{
    
    var hashValue : Int {
        get {
            return "\(amount),\(currency)".hashValue
        }
    }
}


extension Money :  CustomStringConvertible{
    
    var description : String{
        get{
            return  "<\(self.dynamicType): \(amount) \(currency)>"
        }
    }
    
}

//MARK: - Equatable & Comparable
func ==(lhs: Money, rhs: Money) -> Bool{
    
    guard (lhs !== rhs) else{
        return true
    }
    
    return lhs.proxyForComparison == rhs.proxyForComparison
}
