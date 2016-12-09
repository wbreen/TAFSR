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
    
    var assignmentList = DispatchInputModelList()

    @IBAction func addAssignment(_ sender: UIButton) {
        //ToDo: verification that all inputs are correct 
            //todo: do as alert (look up tutorial, and make one for each if statement (Oct 3))
        let newAssignment = DispatchInputModelAssignment()
        if nameTextField.text != "" {
            newAssignment.name = nameTextField.text!
        }
        if partySizeTextField.text != "" && Int(partySizeTextField.text!) != nil{
            newAssignment.size = Int(partySizeTextField.text!)!
        }
        if phoneNumberTextField.text != "" && Int(partySizeTextField.text!) != nil{
            newAssignment.phoneNumber = Int(phoneNumberTextField.text!)!
        }
        if locationTextField.text != "" {
            newAssignment.location = locationTextField.text!
        }
        if destinationTextField.text != "" {
            newAssignment.destination = destinationTextField.text!
        }
        
        //ToDo: add list to the database
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

