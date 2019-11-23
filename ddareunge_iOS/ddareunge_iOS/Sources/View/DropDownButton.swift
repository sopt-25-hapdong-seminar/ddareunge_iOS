//
//  DropDownButton.swift
//  ddareunge_iOS
//
//  Created by 윤동민 on 2019/11/21.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class DropDownButton: UIView {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dotImage: UIImageView!
    private var view: UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    private func initView() {
        guard let view = Bundle.main.loadNibNamed("DropDownButton", owner: self, options: nil)?.first as? UIView else { return }
        self.view = view
        view.frame = self.bounds
        self.addSubview(view)
    }
}

extension DropDownButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        categoryLabel.textColor = .gray
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        categoryLabel.textColor = .black
        NotificationCenter.default.post(name: .clickDropDownButton, object: nil)
    }
}
