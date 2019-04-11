//
//  GameMediator.swift
//  Uno Game
//
//  Created by Fortune Creig on 2019-04-09.
//  Copyright © 2019 laptop. All rights reserved.
//

import Foundation

class GameMediator {
    
    static func compare(_ card1: String, _ card2: String)->Bool{
        let card1Color: String = String.parse(from: card1)!     //value of from custom extend String func
        let card1Num: Int = Int.parse(from: card1)!     //value from custom extend Int
        let card2Color: String = String.parse(from: card2)!
        let card2Num: Int = Int.parse(from: card2)!
        
        return (card1Color == card2Color || card1Num == card2Num)
    }
    
    static func compare(_ cards: [String] )->Bool{
        //gets array of cards and compares in it is a valid play
        var numbers :[Int] = Array<Int>()
        if(cards.count == 2 ){
            return GameMediator.compare(cards[0], cards[1])
        }
        for card in cards{
            numbers.append(Int.parse(from: card)!)
        }
        
        return numbers.dropFirst().allSatisfy({ $0 == numbers.first })
    }
    
}
extension Int {
    static func parse(from string: String) -> Int? {
        return (Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) != nil) ? Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) : 99
    }
}
extension String {
    static func parse(from string: String) -> String? {
        return string.components(separatedBy: CharacterSet.decimalDigits).joined()
    }
}
