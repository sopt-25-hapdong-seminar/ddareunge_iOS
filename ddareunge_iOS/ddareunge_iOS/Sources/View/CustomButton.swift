//
//  CustomButton.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/18.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class CustomButton: UIView {
    
    private var customView: UIView?
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?.first as? UIView else { return }
        customView = view
        initialView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?.first as? UIView else { return }
        customView = view
        initialView()
    }
    
    private func initialView() {
        guard let view = customView else { return }
        view.frame = self.bounds
        view.backgroundColor = .white
        view.makeRounded(cornerRadius: view.frame.width / 20)
        self.addSubview(view)
    }
    
    func setDescriptionLabel(_ description: String) {
        self.descriptionLabel.text = description
    }
}

extension CustomButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.customView?.backgroundColor = .paleTurquoise
        arrowImage.tintColor = .white
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.customView?.backgroundColor = .white
        arrowImage.tintColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        NotificationCenter.default.post(name: .clickCustomButton, object: nil, userInfo: ["button": self])
    }
}
