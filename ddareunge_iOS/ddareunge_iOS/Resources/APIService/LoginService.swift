//
//  LoginService.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

class LoginService {
    static let shared = LoginService()
    
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        return ["id": id, "pwd": pwd]
    }
    
    private func judge(by statusCode: Int, value: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(value)
        case 400: return .pathErr
        case 500: return .networkFail
        default: return .networkFail
        }
    }
    
    private func isUser(_ value: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let getData = try? decoder.decode(LoginData.self, from: value) else { return .pathErr }
        guard let userInfo = getData.data else { return .requestErr(getData.message) }
        if getData.success { return .success(userInfo) }
        else { return .requestErr(getData.message) }
    }
    
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
        
        
        
    }
}
