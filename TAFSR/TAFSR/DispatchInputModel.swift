//
//  DispatchInputModel.swift
//  TAFSR
//
//  Created by Alexandra Meads on 11/28/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import Foundation
import UIKit

class DispatchInputModelAssignment {
    
    //user input
    var name: String = ""
    var size: Int = 0
    var phoneNumber: Int = 0
    var location: String = ""
    var destination: String = ""
    
    //auto generated
    var privateIdentifier: Int = 0
    var isComplete: Bool = false
    var finalSize: Int = 0
    
}

class DispatchInputModelList {
    
    //this needs to let each assignment be accessable from outside the class
    var assignments = [DispatchInputModelAssignment]()
    
    
    /*
    var assignment: [DispatchInputModelAssignment]
    var gotten: [Bool]
    
    init (){
        //create each individual assignment
        //for each, append that you have not gotten it yet in the 'gotten' array, for use later
    }
    
    func getAssignment(_ identifier: Int) -> DispatchInputModelAssignment {
        //which assignment you are looking at (
        var which = 0
        
        //for each assignment starting at 0, you need the name, size, final size, and complete
        repeat {
            
        } while gotten[which]
        
    }
    
    func addAssignment() {
        //adds an assignment to the list of assignments (for when you hit 'add to list')
        
    }
    */
}
