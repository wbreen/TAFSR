//
//  NavigationInfo.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class NavigationInfoController: UIViewController {
    
    @IBOutlet weak var partyName: UILabel!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var partyPhone: UILabel!
    @IBOutlet weak var partyLocation: UILabel!
    @IBOutlet weak var partyDestination: UILabel!
    
    @IBOutlet weak var numPeopleTransported: UITextField!
    
    //let thisNavigator: NavigatorInputModelVehicle = NavigatorInputController.newNavigator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishedTransportation(_ sender: UIButton) {
        //check people transported, set current assignment to complete, go back to prev page
        if numPeopleTransported.text != "" && Int(numPeopleTransported.text!) != nil {
            //update the assignment in the database
        } else {
            showAlert()
        }
    }
    
    //code taken and modified from Joel Hollingsworth Alert example
    func showAlert() {
        
        let alertController = UIAlertController(title: "Missing Information", message: "Please enter the number of people you transported", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

