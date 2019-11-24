//
//  SignupData.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/24.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

struct SignupData: Codable {
    let status: Int
    let success: Bool
    let message: String
}
