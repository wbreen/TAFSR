//
//  NavigatorInputModel.swift
//  TAFSR
//
//  Created by Alexandra Meads on 12/7/16.
//  Copyright © 2016 William Breen, Alexandra Meads. All rights reserved.
//

import Foundation
import UIKit

class NavigatorInputModelVehicle {
    
    //user input
    var vehicleName: String = ""
    
    //auto generated
    var privateIdentifier: Int = 0
    var isAvailable: Bool = true
    
}

class NavigatorInputModelList {
    
    var navigators = [NavigatorInputModelVehicle]()
    
}
