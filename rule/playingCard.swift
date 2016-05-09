//
//  playingCard.swift
//  rule
//
//  Created by wenyu zhao on 4/21/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

class PlayCard: Card {
   var suit: String = ""
   var rank: Int = 0
   
   override var contents: String? {
      get {
         var rankStrings = PlayCard.rankStrings()
         let card = rankStrings.removeAtIndex(self.rank)
         return card + self.suit
      }
      set {
         self.contents = newValue
      }
   }
   
   class func validSuits() -> Array<String> {
      let suits = [String](arrayLiteral: "♥︎", "♦︎", "♠︎", "♣︎")
      return suits
   }
   
   class func rankStrings() -> Array<String> {
      let ranks = [String](arrayLiteral: "?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")
      return ranks
   }
   
   class func maxRank() -> Int {
      return PlayCard.rankStrings().count - 1
   }
}
