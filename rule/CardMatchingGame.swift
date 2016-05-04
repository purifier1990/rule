//
//  CardMatchingGame.swift
//  rule
//
//  Created by wenyuzhao on 4/29/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import Foundation

class CardMatchingGame {
   var cards:Array<Card>
   var score:Int = 0
   
   init() {
      cards = Array()
   }
   
   convenience init(count:Int, deck:Deck) {
      self.init()
      for _ in 1...count {
         let card = deck.drawRandomCard()
         self.cards.append(card)
      }
   }
   
   func cardAtIndex(index:Int) -> Card? {
      var cards = self.cards
      
      if index < cards.count {
         return cards.removeAtIndex(index)
      } else {
         return nil
      }
   }
   
   let bounus = 4
   let penalty = 2
   
   func chooseCardAtIndex(index:Int) {
      if let card = self.cardAtIndex(index) as? PlayCard {
         if !card.matched {
            var flag = false
            for otherCard in self.cards as! Array<PlayCard> {
               if !otherCard.matched && card.rank <= otherCard.rank {
                  flag = true
               } else {
                  flag = false
               }
            }
            if flag {
               card.choosen = false
               card.matched = true
            }
         }
      }
   }
   
}