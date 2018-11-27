//
//  Company.swift
//  TestControls
//
//  Created by Sowrirajan S on 27/11/18.
//  Copyright © 2018 Sowrirajan S. All rights reserved.
//

import Foundation

class Company {
    var employeeName = String()
    var idValue = Int()
    var department = String()
    var designation = String()
    
    init(_ name: String, _ id: Int, _ dept: String) {
        employeeName = name
        idValue = id
        department = dept
    }
}
