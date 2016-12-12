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
    
    var assignments = [DispatchInputModelAssignment]()
    
}
