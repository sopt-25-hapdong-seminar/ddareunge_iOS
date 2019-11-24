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
        guard let id = idTextField.text else { return }
        guard let pw = pwTextField.text else  { return }
        
        LoginService.shared.login(id, pw) { data in
        }
    }
    
    @IBAction func doSignin(_ sender: Any) {
    }
}
