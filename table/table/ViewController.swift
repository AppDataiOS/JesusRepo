//
//  ViewController.swift
//  table
//
//  Created by chucola thomes on 28/07/16.
//  Copyright © 2016 appdata. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet var tableView2: UITableView!
    var array = [String]()
    
    @IBAction func addContact(sender: AnyObject) {
        
        var loginTextField: UITextField?
        let alertController = UIAlertController(title: "Agregar", message: "Agregue un objeto a su lista", preferredStyle: .Alert)
        let add = UIAlertAction(title: "Add", style: .Default, handler: { (action) -> Void in
            self.array.append((loginTextField?.text)!)
           self.tableView.reloadData()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
        }
        alertController.addAction(add)
        alertController.addAction(cancel)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in

        loginTextField = textField
            loginTextField?.placeholder = "Teclee el nombre del objeto"
        }
        presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    @IBAction func showAlert() {
        
    }
    @IBAction func editing(sender: UIButton) {
        
        self.editing = !self.editing
    }
    
   /* var addContactTextField: UITextField?
    let alertController = UIAlertController(title: "UIAlertController", message: "UIAlertController With TextField", preferredStyle: .Alert)
    let nombreAgregar = UIAlertAction(title: , style: .Cancel, handler: {(action) -> Void in
        ptintln("Add button pressed")
 */

    
    //declaration alert
        override func viewDidLoad() {
        array = ["Domingo","Lunes","Martes","Miercoles"]
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    //override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //   return 2
    //}
    
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Cell =  tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        Cell.textLabel?.text = array[indexPath.row]
        
        
        return Cell
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            array.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    // Override to support mover 
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath : NSIndexPath) {
        
         let itemToMove = array[fromIndexPath.row]
        array.removeAtIndex(fromIndexPath.row)
        array.insert(itemToMove, atIndex: toIndexPath.row)
        
        //array.insert(itemToMove, atIndex: toIndexPath.row,
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
}

