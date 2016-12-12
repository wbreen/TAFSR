//
//  ViewController.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dispatchInputModelList = DispatchInputModelList()
    var navigatorInputModelList = NavigatorInputModelList()
    var navigatorInputModelVehicle = NavigatorInputModelVehicle()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDispatchInputController" {
            
            let dispatchInputController = segue.destination as! DispatchInputController
            
            //send list to dispatch view controller
            dispatchInputController.dispatchAssignmentList = dispatchInputModelList
            
            
        } else if segue.identifier == "showNavigatorInputController" {
            
            let navigatorInputController = segue.destination as! NavigatorInputController
            
            //send list and navigator to navigator view controller
            navigatorInputController.navigatorList = navigatorInputModelList
            navigatorInputController.newNavigator = navigatorInputModelVehicle
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

