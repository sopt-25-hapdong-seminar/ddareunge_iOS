//
//  MySpaceViewController.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/18.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class MySpaceViewController: UIViewController {
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var ticketView: UIView!
    @IBOutlet weak var ticketButton: UIButton!
    
    @IBOutlet weak var personalInformManageButton: CustomButton!
    @IBOutlet weak var payManageButton: CustomButton!
    @IBOutlet weak var useInformManageButton: CustomButton!
    @IBOutlet var customButtons: [CustomButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarClear()
        setProfileImage()
        setProfileLabel(id: "SOPT5 :)")
        setTicketView()
        setCustomButtons()
    }
    
    private func setProfileImage() {
        guard let image = UIImage(named: "invalidName") else { return }
        profileButton.setImage(image, for: .normal)
        profileButton.layer.cornerRadius = profileButton.bounds.height / 2
        profileButton.clipsToBounds = true
        profileButton.layer.borderColor = UIColor.lightGreenishBlue.cgColor
        profileButton.layer.borderWidth = 5
    }
    
    private func setProfileLabel(id: String) {
        let profileText = id + " 님"
        self.profileLabel.text = profileText
    }
    
    private func setTicketView() {
        ticketButton.makeShadow()
        ticketButton.layer.cornerRadius = ticketButton.frame.width / 20
        ticketButton.backgroundColor = .paleTurquoise
        ticketButton.layer.borderColor = UIColor.lightGreenishBlue.cgColor
        ticketButton.layer.borderWidth = 3
    }
    
    private func setCustomButtons() {
        personalInformManageButton.setDescriptionLabel("회원정보 관리")
        payManageButton.setDescriptionLabel("결제관리")
        useInformManageButton.setDescriptionLabel("이용정보 관리")
        setCustomButtonsShadow()
    }
    
    private func setCustomButtonsShadow() {
        for customButton in customButtons {
            customButton.makeShadow()
            customButton.layer.cornerRadius = customButton.frame.width / 20
        }
    }
    
    @IBAction func backScreen(_ sender: Any) {
        guard let tabbarController = self.tabBarController as? TabbarController else { return }
        tabbarController.addCenterButton()
        tabbarController.selectedIndex = TabbarViewType.home.rawValue
    }
}
