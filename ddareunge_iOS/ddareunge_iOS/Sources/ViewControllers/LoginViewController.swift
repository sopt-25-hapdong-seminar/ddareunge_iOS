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

    private var dataTransferDelegate: DataTransferDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doSignup(_ sender: Any) {
        SignupService.shared.signup(userId: "Hi", userPwd: "1235") { networkResult in
            switch networkResult {
            case .success(let message):
                guard let message = message as? String else { return }
                self.simpleAlert(title: message, message: "")
                // 뷰 전환하는 코드
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                self.simpleAlert(title: message, message: "")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                self.simpleAlert(title: "네트워크 오류", message: "네트워크 연결을 확인해주세요")
            }
        }
    }
    
    @IBAction func doSignin(_ sender: Any) {
        guard let id = idTextField.text else { return }
        guard let pw = pwTextField.text else  { return }
        
        LoginService.shared.login(id, pw) { networkResult in
            switch networkResult {
            case .success(let data):
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "mainTabbarController") as? TabbarController else { return }
                guard let userData = data as? UserData else { return }
                self.dataTransferDelegate = tabbarController
                self.dataTransferDelegate?.transferData(userData)
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                self.simpleAlert(title: message, message: "ID, PW을 확인해주세요")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                self.simpleAlert(title: "네트워크 오류", message: "네트워크 연결을 확인해주세요")
            }
        }
    }
}
