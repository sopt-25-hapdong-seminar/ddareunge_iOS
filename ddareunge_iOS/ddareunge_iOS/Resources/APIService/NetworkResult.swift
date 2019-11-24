//
//  NetworkResult.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
