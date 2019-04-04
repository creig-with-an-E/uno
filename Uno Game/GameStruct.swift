//
//  GameStruct.swift
//  Uno Game
//
//  Created by Fortune Creig on 2019-04-04.
//  Copyright © 2019 laptop. All rights reserved.
//

import Foundation

struct Game {
    let userCards: [String]
    let cpuCards: [String]
    let deck: [String]
    let discardPile: [String]
    
    init(_ dictionary: [String: Any]) {
        //constructor that receives an object/dictionary
        self.cpuCards = dictionary["cpuCards"] as? [String] ?? []
        self.deck = dictionary["deck"] as? [String] ?? []
        self.discardPile = dictionary["discardPile"] as? [String] ?? []
        self.userCards = dictionary["userCards"] as? [String] ?? []
    }
}
