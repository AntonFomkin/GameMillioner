//
//  MainViewController.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goGame":
            Game.shared.countTrueResponce = GameSession()
        default:
            break
        }
    }
    
}


    
