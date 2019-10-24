//
//  Singleton.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import Foundation

final class Game {
    
    static let shared = Game()
    var countTrueResponce : GameSession?

    var results : [ResultOfGame] = [] {
        didSet {
            recordsCaretaker.save(records: self.results)
        }
    }
    var countQuestion: Int = 1
    private let recordsCaretaker = RecordsCaretaker()
    
    private init() {
        self.results = self.recordsCaretaker.retrieveRecords()
    }
    
    func addResult() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let now = dateFormatter.string(from: Date())
        let procent: Double = ((Double(self.countTrueResponce!.data) / Double(self.countQuestion))) * 100
        self.results.append(ResultOfGame(dateGame: now,score: self.countTrueResponce!.data,procent: procent))
        self.countTrueResponce = nil
    }
}
 
