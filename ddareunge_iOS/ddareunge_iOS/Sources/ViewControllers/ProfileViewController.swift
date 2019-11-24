//
//  ProfileViewController.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/24.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userIdxLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let tabbarController = self.tabBarController as? TabbarController else { return }
    }
}
