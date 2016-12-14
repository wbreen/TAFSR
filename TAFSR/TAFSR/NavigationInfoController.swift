//
//  NavigationInfo.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class NavigationInfoController: UIViewController {
    //make instances of nav list, assignment list, etc in viewcontroller
    
    @IBOutlet weak var partyName: UILabel!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var partyPhone: UILabel!
    @IBOutlet weak var partyLocation: UILabel!
    @IBOutlet weak var partyDestination: UILabel!
    
    @IBOutlet weak var numPeopleTransported: UITextField!
    
    var navigatorList = NavigatorInputModelList()
    var thisNavigator = NavigatorInputModelVehicle()
    
    //unused because disabled user ability to go back to new navigator screen
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     if segue.identifier == "showNavigationInfoController" {
     
     let navigatorInputController = segue.destination as! NavigatorInputController
     
     //send list & vehicle to navigator input controller
     navigatorInputController.navigatorList = navigatorList
     navigatorInputController.newNavigator = thisNavigator
     
     }
     
     }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // from http://stackoverflow.com/questions/32010429/how-to-disable-back-button-in-navigation-bar
        navigationItem.hidesBackButton = true
        
        //WAS CAUSING INDEX ERROR
        //let assignmentList = DispatchInputModelList()
        //partyName?.text = "\(assignmentList.assignments[0].name)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishedTransportation(_ sender: UIButton) {
        //check people transported, set current assignment to complete, go back to prev page
        
        if numPeopleTransported.text != "" && Int(numPeopleTransported.text!) != nil {
            //update the assignment in the database
            
            numPeopleTransported.text = ""
            
        } else {
            showAlert()
        }
    }
    
    // code taken and modified from Joel Hollingsworth Alert example
    func showAlert() {
        
        let alertController = UIAlertController(title: "Missing Information", message: "Please enter the number of people you transported", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
}
