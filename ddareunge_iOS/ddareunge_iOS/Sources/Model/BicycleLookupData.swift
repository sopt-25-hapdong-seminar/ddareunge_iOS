//
//  BicycleLookupData.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/24.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

struct BicycleLookupData: Codable {
    let success: Bool
    let message: String
    let data: [BicycleOffice]?
}

struct BicycleOffice: Codable {
    let officeNum: String
    let numOfBicycle: String
}
