//
//  Car.swift
//  TestControls
//
//  Created by Sowrirajan S on 27/11/18.
//  Copyright © 2018 Sowrirajan S. All rights reserved.
//

import Foundation
import CoreLocation
class Car {
    let brandName: String
    let registrationNumber: Int
    let location: CarLocation
    init(brandName: String, regNumber: Int, location: CarLocation) {
        self.brandName = brandName
        self.registrationNumber = regNumber
        self.location = location
    }
}

class CarLocation {
    let location: CLLocation
    init(location: CLLocation) {
        self.location = location
    }
}
