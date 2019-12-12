//
//  LoginService.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService()
    
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.loginURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value: value)
                completion(networkResult)
            case .failure(let err):
                print("\(err.localizedDescription)")
                completion(.networkFail)
            }
        }
    }
    
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        return ["userId": id, "userPwd": pwd]
    }
    
    private func judge(by statusCode: Int, value: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(value)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .serverErr
        }
    }
    
    private func isUser(_ value: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let getData = try? decoder.decode(LoginData.self, from: value) else { return .pathErr }
        guard let userInfo = getData.data else { return .pathErr }
        if getData.success { return .success(userInfo) }
        else { return .requestErr(getData.message) }
    }
}