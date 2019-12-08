//
//  LoginViewController.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/23.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doSignup(_ sender: Any) {
    }
    
    @IBAction func doSignin(_ sender: Any) {
        guard let id = idTextField.text else { return }
        
        // 싱글톤 패턴이기 때문에 다른 파일이어도 접근 가능
        SigninService.shared.signin(id) {
            data in
            
            switch data {
                
            case .success(let data):
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰, 이름, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.id, forKey: "id")
                
                // instantiate -> 스토리보드 객체화하기
                guard let main = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") else {return}
                self.present(main, animated: true)
                
            case .requestErr(let message):
                print(message)
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("네트워크 상태를 확인해주세요.")
            }
        }
    }
}
