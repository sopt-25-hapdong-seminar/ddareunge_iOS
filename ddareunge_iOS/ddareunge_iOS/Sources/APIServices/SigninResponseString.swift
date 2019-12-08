//
//  ResponseString.swift
//  ddareunge_iOS
//
//  Created by 김현지 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - ResponseString
// 성공했을 때 response body
struct SigninResponseString: Codable {
    let success: Bool
    let message: String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let userIdx: Int
    let id: String
}
