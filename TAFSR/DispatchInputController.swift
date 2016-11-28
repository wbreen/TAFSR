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
        let newAssignment = DispatchInputModelAssignment()
        if nameTextField.text != "" {
            newAssignment.name = nameTextField.text!
        }
        if partySizeTextField.text != "" && Int(partySizeTextField.text!) != nil{
            newAssignment.size = Int(partySizeTextField.text!)
        }
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

