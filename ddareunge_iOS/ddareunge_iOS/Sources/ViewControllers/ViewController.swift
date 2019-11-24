//
//  ViewController.swift
//  ddareunge_iOS
//
//  Created by 안재은 on 16/11/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberBCButtons: [UIButton]!
    @IBOutlet weak var trackingButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationLabelImage: UIImageView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet var dropMenuButtons: [UIButton]!
    
    private var bicycleOffices: [BicycleOffice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNaviTitleView()
        setNavigationBarClear()
        setNaviBarGradient()
        setBCButtons()
        setTrackingButton()
        setLocationLabel()
        setSearchBarView()
        addObservers()
        loadBicycleNumberOfOffice()
        dropMenuButtons.forEach { button in
            button.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(showDropDownMenu), name: .clickDropDownButton, object: nil)
    }
    
    @objc func showDropDownMenu() {
        dropMenuButtons.forEach { button in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func setNaviTitleView() {
        guard let titleImage = UIImage(named: "logo") else { return }
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFill
        self.navigationItem.titleView = titleImageView
    }
    
    private func setNaviBarGradient() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        let gradient = CAGradientLayer()
        var gradientFrame = navigationBar.bounds
        guard let statusBarHeight = getCurrentWindow()?.windowScene?.statusBarManager?.statusBarFrame.height else { return }
        gradientFrame.size.height += statusBarHeight
        gradient.frame = gradientFrame
        gradient.colors = [UIColor.white.cgColor, UIColor.white.withAlphaComponent(0).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 3)
        
        guard let image = getImageFrom(gradient) else { return }
        navigationBar.setBackgroundImage(image, for: .default)
    }
    
    private func getImageFrom(_ gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return gradientImage }
        gradientLayer.render(in: context)
        gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    private func setBCButtons() {
        for button in numberBCButtons {
            button.layer.cornerRadius = button.frame.width / 2
            button.setBackgroundColor(.aquaMarine, for: .normal)
            button.setBackgroundColor(.gray, for: .highlighted)
            button.clipsToBounds = true
            button.alpha = 0.7
            button.makeShadow()
            button.titleLabel?.textColor = .white
        }
    }
    
    private func setTrackingButton() {
        guard let image = UIImage(named: "btnFloating") else { return }
        trackingButton.setImage(image, for: .normal)
        trackingButton.backgroundColor = .white
        trackingButton.layer.cornerRadius = trackingButton.frame.width / 2
        trackingButton.makeShadow()
    }
    
    private func setLocationLabel() {
        locationLabel.makeShadow()
        locationLabelImage.makeShadow()
    }
    
    private func setSearchBarView() {
        searchBarView.makeShadow()
        searchBarView.layer.cornerRadius = 10
    }
    
    private func loadBicycleNumberOfOffice() {
        BicycleLookupService.shared.lookup { networkResult in
            switch networkResult {
            case .success(let data):
                guard let bicycleOffices = data as? [BicycleOffice] else { return }
                self.bicycleOffices = bicycleOffices
            case .requestErr(let message):
                guard let message = message as? String else { return }
                self.simpleAlert(title: message, message: "전체를 조회하는데 실패하였습니다. 다시 시도해주세요")
            case .serverErr: print(".serverErr")
            case .pathErr: print("pathErr")
            case .networkFail:
                self.simpleAlert(title: "네트워크오류", message: "네트워크 연결을 확인해주세요")
            }
        }
    }
}


extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
