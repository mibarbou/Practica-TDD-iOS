//
//  AppDelegate.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 19/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let broker = Broker()
        
        broker.addRate(1.12, fromCurrency:"EUR", toCurrency:"USD")
        
        let euro1 = Money.euroWith(amount: 20)
        let euro2 = Money.euroWith(amount: 10)
        let dollar1 = Money.dollarWith(amount: 10)
        let dollar2 = Money.dollarWith(amount: 2)
        let dollar3 = Money.dollarWith(amount: 50)
        
        let wallet = Wallet(broker: broker)
        
        wallet.add(money: dollar3)
        wallet.add(money: euro1)
        wallet.add(money: euro2)
        wallet.add(money: dollar1)
        wallet.add(money: dollar2)
        
        let walletVC = WalletTableViewController(model: wallet)
        
        let nav = UINavigationController(rootViewController: walletVC)
        
        self.window?.rootViewController = nav
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

