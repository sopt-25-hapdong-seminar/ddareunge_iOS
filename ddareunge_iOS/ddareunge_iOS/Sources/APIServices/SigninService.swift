//
//  LoginService.swift
//  ddareunge_iOS
//
//  Created by 김현지 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct SigninService {
    // Singleton 패턴 -> 프로그램의 어디서나 전역으로 사용할 수 있음. 프로그램의 생애주기에서 딱 하나의 객체 생성.
    static let shared = SigninService()
    
    // NetworkResult = 통신상태
    // escaping -> NetworkResult (통신상태) case 사용하기위해
    // id, pwd = body에 담을 파라미터 + escaping closure
    func signin(_ id: String, _ pw: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        // 파라미터로 값을 받아와서 body에 넣는다.
        let body: Parameters = [
            "userId" : id,
            "userPwd" : pw
        ]
        
        Alamofire.request(APIConstants.SigninURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { response in
            
        }
        
    } // func login
} // struct

