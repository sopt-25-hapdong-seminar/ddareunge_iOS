//
//  BicycleLookupService.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/24.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct BicycleLookupService {
    static let shared = BicycleLookupService()
    
    func lookup(completion: @escaping (NetworkResult<Any>) -> Void) {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.bicyclieLookupURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        
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
    
    private func judge(by statusCode: Int, value: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isLookup(value)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .serverErr
        }
    }
    
    private func isLookup(_ value: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let getData = try? decoder.decode(BicycleLookupData.self, from: value) else { return .pathErr }
        guard let bicycleOffices = getData.data else { return .pathErr }
        if getData.success { return .success(bicycleOffices) }
        else { return .requestErr(getData.message) }
    }
    
}
