//
//  buttonStyle.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class buttonStyle: UIButton {

        override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            layer.cornerRadius = 10
            layer.masksToBounds = true
        }
}
