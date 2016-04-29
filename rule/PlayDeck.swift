//
//  PlayDeck.swift
//  rule
//
//  Created by wenyuzhao on 4/29/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import Foundation

class PlayingCardDeck: Deck {
   override init() {
   super.init()
      for suit in PlayCard.validSuits() {
         for var rank = 1; rank <= PlayCard.maxRank(); rank+=1 {
            let card = PlayCard()
            card.suit = suit
            card.rank = rank
            self.addCard(card)
         }
      }
   }
}