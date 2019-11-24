//
//  SignupService.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/24.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct SignupService {
    static let shared = SignupService()
    
    func signup(userId: String, userPwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(userId, userPwd), encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value: value)
                completion(networkResult)
            case .failure(let err):
                completion(.networkFail)
                print(err.localizedDescription)
            }
        }
    }
    
    private func makeParameter(_ userId: String, _ userPwd: String) -> Parameters {
        return ["userID": userId, "userPwd": userPwd]
    }
    
    private func judge(by statusCode: Int, value: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            let decoder = JSONDecoder()
            guard let signupData = try? decoder.decode(SignupData.self, from: value) else { return .pathErr }
            if signupData.success && signupData.status == 200{ return .success(signupData.message) }
            else { return .requestErr(signupData.message) }
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
