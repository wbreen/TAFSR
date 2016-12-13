//
//  DispatchTableViewController.swift
//  TAFSR
//
//  Created by William Breen on 12/11/16.
//  Copyright © 2016 William Breen. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var finalSize: UILabel!
    @IBOutlet weak var cancel: UIButton!
    @IBAction func cancelButton(_ sender: UIButton) {
        
        //if the cancel button is hit, set "final size" to "cancelled", boolean to complete
        //if not complete, set cancelButton to touchable and finalSize to ""
        //if complete, disable cancel button and set finalSize to the final size
    }
    
}

class DispatchTableViewController: UITableViewController {
    
    var assignmentList = DispatchInputModelList()
    //var assignment = DispatchInputModelAssignment()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDispatchQueueController" {
            
            let dispatchInputController = segue.destination as! DispatchInputController
            
            //send list to dispatch input controller
            dispatchInputController.dispatchAssignmentList = assignmentList
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // returns the same amount of rows as there are total assignments (ToDo)

        let numRows = assignmentList.assignments.count
        print(numRows)

        return numRows
        
    }
    
    @IBAction func cancelCar(_ sender: UIButton) {
        sender.isEnabled = false
        sender.setTitle("", for: .normal)
        let cell = CustomerTableViewCell()
        cell.finalSize?.text = "Literally anything"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! CustomerTableViewCell
        
        //needs to get the assignment from the assignment list, then name, size, and cancel
        //these will be the same for each person in the assignment list
        
        //how to get the current row that you're on:
        /*indexPath.row*/
        

        //have to figure out how to get the values out of the array of the assignmentList of assignments
        //<HERE>
        print(assignmentList.assignments)
        cell.nameLabel?.text = "\(assignmentList.assignments[indexPath.row].name)"
        //cell.nameLabel?.text = "name"
        
        //</HERE>
        cell.sizeLabel?.text = "\(assignmentList.assignments[indexPath.row].size)"
        //cell.sizeLabel?.text = "size"
        
        
        
        //this may change, depending on the boolean, also need to change the background color of the cell
        
        //if the assignment is complete, or if cancel has been hit (aka disabled) then have finalSize be black and a number
        if (assignmentList.assignments[indexPath.row].isComplete) {

            
            cell.finalSize?.text = "\(assignmentList.assignments[indexPath.row].finalSize)"
            cell.finalSize?.textColor = UIColor.black
            
            cell.cancel.setTitle("", for: .normal)
            cell.cancel.isEnabled = false
            
        }
        //if cancel has been hit, set final size == to sizeLabel
        if !(cell.cancel.isEnabled){
            cell.finalSize?.text = cell.sizeLabel?.text
            cell.finalSize?.textColor = UIColor.black
            
        } else {
            //need to redo this, show final size of the party or that it was cancelled
            //make the actual button not touchable, and background color different
//            cell.finalSize?.text = "\(assignmentList.assignments[indexPath.row].finalSize)"
//            cell.finalSize?.textColor = UIColor.black
//            cell.cancel.setTitle("", for: .normal)
//            cell.cancel.isEnabled = false
//            
            cell.finalSize?.text = ""
            cell.finalSize?.textColor = UIColor.red
            
            cell.cancel.setTitle("Cancel", for: .normal)
        }
        
        
        return cell
    }
    

    
    //*/
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
