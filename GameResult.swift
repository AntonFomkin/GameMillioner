//
//  Protocols.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import Foundation

protocol GameResultDelegate: class {
    func eventEndGame(result: Int)
}
