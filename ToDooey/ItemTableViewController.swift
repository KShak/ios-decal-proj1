//
//  ItemTableViewController.swift
//  ToDooey
//
//  Created by Khalid Shakur on 10/8/16.
//  Copyright © 2016 khalidshakur. All rights reserved.
//

import UIKit
import Foundation

class ItemTableViewController: UITableViewController, CustomCellDelegate {
    @IBOutlet weak var statsButton: UIBarButtonItem!
    
    var items = [Item]()
    var closedCount = 0
    var tfhours = Double(86400)
//    var tfhours = Double(3)
    var numCompleted = 0
    
    func cellButtonTapped(cell: ItemTableViewCell) {
        let indexPath = self.tableView.indexPathForRow(at: cell.center)!
        let selectedItem = items[indexPath.row]
//        print(cell.switchy.isOn)
        selectedItem.completed = !(selectedItem.completed)
        if selectedItem.completed {
            self.numCompleted += 1
        } else {
            self.numCompleted -= 1
        }
//        print("ay")
//        cell.switchy.isOn = !(cell.switchy.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: tfhours, target: self, selector: #selector(self.update), userInfo: nil, repeats: true);
        Timer.scheduledTimer(timeInterval: tfhours, target: self, selector: #selector(self.update1), userInfo: nil, repeats: true);
        // Load sample data.
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func update() {
//        print("check if anythng needs to be removed")
        print("made it")
        var counter = 0
        for it in self.items {
            let elapsed = NSDate().timeIntervalSince1970 - it.timestamp
            if (it.completed && elapsed >= self.tfhours) {
                self.items.remove(at: counter)
                let indexPath: IndexPath = IndexPath(row: Int(counter), section: Int(0))
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
                counter = counter + 1
            }
        }
    }
    
    func update1() {
//        print("reset count")
        self.numCompleted = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        cell.delegate = self
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        cell.switchy.isOn = true
//        cell.switchy.setOn(false, animated: true)
//        cell.switchy = UISwitch()
//        DispatchQueue.main.async {
//            cell.switchy.setOn(false, animated: true)
//        }
        //        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
//        print(cell.nameLabel.text)
        //        self.tableView.reloadData()
//        print(cell.switchy.isOn)
//        print("getting it")
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let item = sourceViewController.item {
            let newIndexPath = NSIndexPath(row: items.count, section: 0)
//            print("here")
//            print(item.completed)
            items.append(item)
            let cell = self.tableView.cellForRow(at: newIndexPath as IndexPath)
//            print(cell)
//            print("dawg")
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if statsButton == sender as! UIBarButtonItem{
        let secondViewController = segue.destination as! UINavigationController
        let targetController = secondViewController.topViewController as! Controller
        targetController.rar = String(self.numCompleted)
//        print(targetController.rar)
//        print("preparing")
        }
    }
    
}
