//
//  ResultCell.swift
//  Millioner
//
//  Created by Anton Fomkin on 10/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    static let reuseId = "ResultCell"

    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var procent: UILabel!
   
    override func prepareForReuse() {
        super.prepareForReuse()
        score.text = nil
        date.text = nil
        procent.text = nil
    }
}


