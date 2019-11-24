//
//  TabbarController.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/20.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    private var centerButton: UIButton?
    var userData: UserData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLocationOfTabItems()
        self.delegate = self
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setCenterButton()
    }
    
    private func setLocationOfTabItems() {
        guard let items = tabBar.items else { return }
        items[1].titlePositionAdjustment = UIOffset(horizontal: -15, vertical: 0)
        items[2].titlePositionAdjustment = UIOffset(horizontal: 15, vertical: 0)
    }
    
    private func setCenterButton() {
        let centerButton = UIButton(frame: CGRect(x: 0, y: 0, width: tabBar.frame.height + 10, height: tabBar.frame.height + 10))
        centerButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y:
            tabBar.center.y - view.safeAreaInsets.bottom - tabBar.frame.height + centerButton.frame.height/2)
        centerButton.layer.cornerRadius = centerButton.frame.width / 2
        centerButton.clipsToBounds = true
        guard let buttonImage = UIImage(named: "btn") else { return }
        centerButton.setBackgroundImage(buttonImage, for: .normal)
        centerButton.backgroundColor = .clear
        self.centerButton = centerButton
        centerButton.addTarget(self, action: #selector(centerButtonAction(sender:)), for: .touchUpInside)
        addCenterButton()
    }
    
    // Center Button 클릭 시 동작
    @objc func centerButtonAction(sender: UIButton) {
    }
    
    func addCenterButton() {
        guard let centerButton = self.centerButton else { return }
        self.view.addSubview(centerButton)
    }
}

extension TabbarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controllers = tabBarController.viewControllers else { return }
        
        switch viewController {
        case controllers[TabbarViewType.mySpace.rawValue]:
            centerButton?.removeFromSuperview()
            viewController.tabBarController?.tabBar.isHidden = true
        default:
            if !isExistCenterButton() {
                guard let centerButton = self.centerButton else { return }
                self.view.addSubview(centerButton)
            }
        }
    }
    
    private func isExistCenterButton() -> Bool {
        for view in view.subviews {
            if view == centerButton { return true }
        }
        return false
    }
}

extension TabbarController: DataTransferDelegate {
    func transferData(_ userData: UserData) {
        self.userData = userData
    }
}
