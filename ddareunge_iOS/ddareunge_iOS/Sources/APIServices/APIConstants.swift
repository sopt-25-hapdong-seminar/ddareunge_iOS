//
//  APIConstants.swift
//  ddareunge_iOS
//
//  Created by 김현지 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

struct APIConstants {
    
    // 전역 변수로 사용할 수 있게 APIConstants 선언하여 사용
    static let BaseURL = "http://3.18.41.203:3000/users"
    
    /* 유저(User) */
    static let SigninURL = BaseURL + "/signin" // 로그인
    static let SignupURL = BaseURL + "/signup" // 회원가입
    static let SearchURL = BaseURL + "/:userIdx" // 회원조회
}
