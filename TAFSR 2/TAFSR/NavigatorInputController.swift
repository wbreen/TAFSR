//
//  NavigatorInput.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class NavigatorInputController: UIViewController {
    
    @IBOutlet weak var vehicleName: UITextField!
    @IBOutlet weak var numSeats: UITextField!
    
    let newNavigator = NavigatorInputModelVehicle()
    
    @IBAction func goButton(_ sender: UIButton) {
        //adds vehicle name to database, saves for use in assignment distribution
        
        if vehicleName.text != "" {
            newNavigator.vehicleName = vehicleName.text!
        } else {
            showAlert()
        }
        
    }
    
    //code taken and modified from Joel Hollingsworth Alert example
    func showAlert() {
        let alertController = UIAlertController(title: "Missing Information", message: "Please enter a name for your vehicle", preferredStyle: .alert)
        
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

