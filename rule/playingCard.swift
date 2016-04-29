//
//  playingCard.swift
//  rule
//
//  Created by wenyu zhao on 4/21/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

class PlayCard: Card {
    var suit: String {
        set {
            if PlayCard.validSuits().contains(newValue) {
                self.suit = newValue
            }
        }
        get {
            if self.suit.isEmpty {
                return "?"
            } else {
                return self.suit
            }
        }
    }
    var rank: Int {
        set {
            if newValue <= PlayCard.maxRank() {
                self.rank = newValue
            }
        }
        get {
            return self.rank
        }
    }
   
   override var contents: String? {
      get {
         var rankStrings = PlayCard.rankStrings()
         let card = rankStrings.removeAtIndex(self.rank)
         return card + self.suit
      }
      set {
         
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
   
   func match(otherCards: Array<PlayCard>) -> Int {
      var score = 0
      if otherCards.count == 1 {
         if let card = otherCards.first {
            let otherCard = card
            if self.suit == otherCard.suit {
               score = 1
            } else if self.rank == otherCard.rank {
               score = 4
            }
         }
      }
      return score;
   }
}
