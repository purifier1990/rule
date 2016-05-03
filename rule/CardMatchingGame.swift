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
      if let card = self.cardAtIndex(index) {
         if !card.matched {
            if card.choosen {
               card.choosen = false
            } else {
               for otherCard in self.cards {
                  if otherCard.choosen && !otherCard.matched {
                     let matchScore = card.match([otherCard])
                     if matchScore > 0 {
                        self.score += matchScore * bounus
                        card.matched = true
                        otherCard.matched = true
                     } else {
                        self.score -= penalty
                        otherCard.choosen = false
                     }
                     break
                  }
               }
               self.score -= 1
               card.choosen = true
            }
         }
      }
   }
   
}