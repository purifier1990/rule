//
//  playingCard.swift
//  rule
//
//  Created by wenyu zhao on 4/21/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import UIKit

class PlayCard: Card {
    var suit: NSString {
        set(newValue){
            if self.validSuits().contains(newValue) {
                self.suit = newValue
            }
        }
        get{
            if self.suit.length != 0 {
                return self.suit
            } else {
                return "?"
            }
        }
    }
    var rank: NSInteger {
        set(newValue) {
            if newValue <= self.maxRank() {
                self.rank = newValue
            }
        }
        get {
            return self.rank
        }
    }
    
    init(suit: NSString, rank: NSInteger) {
        super.init()
        self.suit = suit
        self.rank = rank
    }
    
    func validSuits() -> [NSString] {
        let suits = [NSString](arrayLiteral: "♥︎", "♦︎", "♠︎", "♣︎")
        return suits
    }
    
    func rankStrings() -> [NSString] {
        let ranks = [NSString](arrayLiteral: "?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")
        return ranks
    }

    func maxRank() -> NSInteger {
        return self.rankStrings().count - 1
    }
    
}
