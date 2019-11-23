//
//  UIColor+Extensions.swift
//  ddareunge_iOS
//
//  Created by 안재은 on 16/11/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

// color extension
// 제플린 style guide에서 따오기.

extension UIColor {
    @nonobjc class var lightGreenishBlue: UIColor {
      return UIColor(red: 114.0 / 255.0, green: 235.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var brownishGrey: UIColor {
      return UIColor(white: 112.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var paleTurquoise: UIColor {
      return UIColor(red: 174.0 / 255.0, green: 244.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var aquaMarine: UIColor {
      return UIColor(red: 40.0 / 255.0, green: 239.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0)
    }
}
