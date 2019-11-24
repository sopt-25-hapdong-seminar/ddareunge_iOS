//
//  LoginData.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation


struct LoginData: Codable {
    let success: Bool
    let message: String
    let data: UserData?
}

struct UserData: Codable {
    let userId: String
    let userPwd: String
}
