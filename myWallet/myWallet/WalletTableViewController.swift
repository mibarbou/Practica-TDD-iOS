//
//  WalletTableViewController.swift
//  myWallet
//
//  Created by Michel Barbou Salvador on 26/07/16.
//  Copyright © 2016 mibarbou. All rights reserved.
//

import UIKit

let cellId = "Cell"

class WalletTableViewController: UITableViewController {
    
    let model : Wallet
    
    init(model: Wallet){
        
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "myWallet"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addNewMoney))
        self.navigationItem.leftBarButtonItem = addButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model.sectionsCount
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.rowsInSection(section)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        if cell == nil{
            // El optional está vacío: hay que crearla a pelo
            cell = UITableViewCell(style: .Subtitle,
                                     reuseIdentifier: cellId)
        }
        
        // Configure the cell...
        let money = model.moneyAt(indexPath: indexPath)
        
        if money.isSubTotal {
            
            cell!.textLabel?.text = "Subtotal: \(money.currency) \(money.amount)"
        } else {
        
            cell!.textLabel?.text = "\(money.currency) \(money.amount)"
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return model.sectionNameAt(index: section)
    }
    
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
        return model.checkEditableMoneyAt(indexPath: indexPath)
     }
 
    
    
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
         if editingStyle == .Delete {
         // Delete the row from the data source
        
            let removed = model.takeMoneyAt(indexPath: indexPath)
            
            if removed {
            
//                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
                tableView.reloadData()
            }

         } else if editingStyle == .Insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
    
    func addNewMoney()  {
        
        // Mejora, mostrar un AlertController en el que poder introducir el amount y el currency que vamos a añadir
        model.add(money: Money.euroWith(amount: 10))
        
        tableView.reloadData()
    }
 
    
   
    
}
