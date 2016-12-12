//
//  DispatchQueue.swift
//  TAFSR
//
//  Created by William Breen on 11/16/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import UIKit

class DispatchQueueController: UIViewController {
    
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //ToDo: create UI table view using Oct 12 tutorial, creates assignments programmatically
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

