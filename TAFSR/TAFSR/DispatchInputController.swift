//
//  DispatchInput.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class DispatchInputController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var partySizeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    
    var dispatchAssignmentList = DispatchInputModelList()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDispatchTableViewController" {
            
            let dispatchTableViewController = segue.destination as! DispatchTableViewController
            
            //send list to dispatch queue controller
            dispatchTableViewController.assignmentList = dispatchAssignmentList
            
        } else if segue.identifier == "showDispatchInputController" {
            
            let firstViewController = segue.destination as! ViewController
            
            //send list to first view controller
            firstViewController.dispatchInputModelList = dispatchAssignmentList
        }
        
    }

    // add new assigment to list and database
    @IBAction func addAssignment(_ sender: UIButton) {
        
        let newAssignment = DispatchInputModelAssignment()
        
        if verifyAssignmentInfo() {
            
            newAssignment.name = nameTextField.text!
            newAssignment.size = Int(partySizeTextField.text!)!
            newAssignment.phoneNumber = Int(phoneNumberTextField.text!)!
            newAssignment.location = locationTextField.text!
            newAssignment.destination = destinationTextField.text!
            
            newAssignment.privateIdentifier = createUniqueIdentifier()
            
            dispatchAssignmentList.assignments.append(newAssignment)
            print(dispatchAssignmentList.assignments.count)
            
            nameTextField.text = ""
            partySizeTextField.text = ""
            phoneNumberTextField.text = ""
            locationTextField.text = ""
            destinationTextField.text = ""
            
        } else {
            showAlert()
        }
        
        //ToDo: add list to the database
    }
    
    //verify their is info in each field
    func verifyAssignmentInfo() -> Bool {
        
        if nameTextField.text != "" && partySizeTextField.text != "" && Int(partySizeTextField.text!) != nil && phoneNumberTextField.text != "" && Int(partySizeTextField.text!) != nil && locationTextField.text != "" && destinationTextField.text != "" {
            return true
        } else {
            return false
        }
        
    }
    
    //unique identifier for an assignment
    func createUniqueIdentifier() -> Int {
        
        var uniqueIdentifier = Int(arc4random())
        for var i in 0..<dispatchAssignmentList.assignments.count {
            if uniqueIdentifier == dispatchAssignmentList.assignments[i].privateIdentifier {
                uniqueIdentifier = Int(arc4random())
                i = 0
            }
        }
        return uniqueIdentifier
    }
    
    // code taken and modified from Joel Hollingsworth Alert example
    func showAlert() {
        
        let alertController = UIAlertController(title: "Missing Information", message: "Please fill in all fields", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

