//
//  GameSession.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import Foundation

class GameSession {
    var data : Int = 0
}

extension GameSession: GameResultDelegate {
    func eventEndGame(result: Int) {
        Game.shared.countTrueResponce?.data = result
        Game.shared.addResult()
    }
}
