//
//  DispatchTableViewController.swift
//  TAFSR
//
//  Created by William Breen on 12/11/16.
//  Copyright © 2016 William Breen. All rights reserved.
//

import UIKit

typealias ButtonHandler = (CustomerTableViewCell) -> Void

class CustomerTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var finalSize: UILabel!
    @IBOutlet weak var cancel: UIButton!
    @IBAction func cancelButton(_ sender: UIButton) {
        sender.isEnabled = false
        sender.setTitle("Cancelled", for: .normal)
        
        cancelRide?(self)
        
        //if the cancel button is hit, set "final size" to "cancelled", boolean to complete
        //if not complete, set cancelButton to touchable and finalSize to ""
        //if complete, disable cancel button and set finalSize to the final size
    }
    //configureWithValue, cancelRide, and reloadCellAtRow all adapted from http://stackoverflow.com/questions/32931731/ios-swift-update-uitableview-custom-cell-label-outside-of-tableview-cellforrow
    //as well as some smaller things to make the row update if there was a change in the array
    var cancelRide: ButtonHandler?
    
    func configureWithValue(cancelRide: ButtonHandler?){
        finalSize.text = ""
        self.cancelRide = cancelRide
    }
}

class DispatchTableViewController: UITableViewController {
    
    var assignmentList = DispatchInputModelList()
    
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
        self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numRows = assignmentList.assignments.count
        return numRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! CustomerTableViewCell
        
        //needs to get assignment from assignment list, then name, size, and isComplete
        
        cell.nameLabel?.text = "\(assignmentList.assignments[indexPath.row].name)"
        cell.sizeLabel?.text = "\(assignmentList.assignments[indexPath.row].size)"
        cell.configureWithValue(cancelRide: cancelRide())
        
        //this may change, depending on the boolean, also need to change the background color of the cell
        
        //if the assignment is complete, or if cancel has been hit (aka disabled) then have finalSize be black and a number
        if (assignmentList.assignments[indexPath.row].isComplete) {
            cell.finalSize?.text = "\(assignmentList.assignments[indexPath.row].finalSize)"
            cell.finalSize?.textColor = UIColor.black
            
            cell.cancel.setTitle("", for: .normal)
            cell.cancel.isEnabled = false
            cell.backgroundColor = UIColor.lightGray
        }
        else {
            //need to redo this, show final size of the party or that it was cancelled
            //make the actual button not touchable, and background color different
            //            cell.finalSize?.text = "\(assignmentList.assignments[indexPath.row].finalSize)"
            //            cell.finalSize?.textColor = UIColor.black
            //            cell.cancel.setTitle("", for: .normal)
            //            cell.cancel.isEnabled = false
            //
            cell.finalSize?.text = ""
            cell.finalSize?.textColor = UIColor.black
            
            cell.cancel.setTitle("Cancel", for: .normal)
        }
        
        return cell
    }
    
    func cancelRide() -> ButtonHandler {
        return { [unowned self] cell in
            guard let row = (self.tableView.indexPath(for: cell) as NSIndexPath?)?.row else { return }
            self.assignmentList.assignments[row].finalSize = self.assignmentList.assignments[row].size
            self.assignmentList.assignments[row].isComplete = true
            
            self.reloadCellAtRow(row)
        }
    }
    
    func reloadCellAtRow(_ row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
}
}
