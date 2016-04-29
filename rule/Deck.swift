//
//  Deck.swift
//  rule
//
//  Created by wenyuzhao on 4/29/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import Foundation

class Deck {
   var cards:Array<Card> = Array()
   
   func addCard(card:Card, atTop:Bool) {
      if atTop {
         self.cards.insert(card, atIndex: 0)
      } else {
         self.cards.append(card)
      }
   }
   
   func addCard(card:Card) {
      addCard(card, atTop: false)
   }
   
   func drawRandomCard() -> PlayCard {
      var randomCard:PlayCard = PlayCard()
      if self.cards.count > 0 {
         let index = Int(arc4random()) % self.cards.count
         randomCard = self.cards.removeAtIndex(index) as! PlayCard
      }
      return randomCard
   }
}