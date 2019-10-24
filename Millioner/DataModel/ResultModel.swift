//
//  ResultModel.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import Foundation

struct ResultOfGame: Codable {
    var dateGame: String
    var score: Int
    var procent: Double
}
