//
//  NavigatorInput.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class NavigatorInputController: UIViewController {
    
    @IBOutlet weak var vehicleNameField: UITextField!
    //@IBOutlet weak var numSeatsField: UITextField!
    
    var newNavigator = NavigatorInputModelVehicle()
    var navigatorList = NavigatorInputModelList()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showNavigationInfoController" {
            
            let navigationInfoController = segue.destination as! NavigationInfoController
            
            //send list & vehicle to navigation info controller
            goButton()
            navigationInfoController.navigatorList = navigatorList
            navigationInfoController.thisNavigator = newNavigator
            
        } else if segue.identifier == "showNavigatorInputController" {
            
            let firstViewController = segue.destination as! ViewController
            
            //send list & vehicle to first view controller
            firstViewController.navigatorInputModelList = navigatorList
            firstViewController.navigatorInputModelVehicle = newNavigator
        }
        
    }
    
    func goButton(/*_ sender: UIButton*/) {
        //adds vehicle name to database, saves for use in assignment distribution
        
        if vehicleNameField.text != "" {
            newNavigator.vehicleName = vehicleNameField.text!
            
            //unique identifier for this navigator
            var uniqueIdentifier = Int(arc4random())
            for var i in 0..<navigatorList.navigators.count {
                if uniqueIdentifier == navigatorList.navigators[i].privateIdentifier {
                    uniqueIdentifier = Int(arc4random())
                    i = 0
                }
            }
            newNavigator.privateIdentifier = uniqueIdentifier
            navigatorList.navigators.append(newNavigator)
            print(navigatorList.navigators.count)
            
        } else {
            showAlert()
        }
    }
    
    // code taken and modified from Joel Hollingsworth Alert example
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

