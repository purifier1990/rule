//
//  card.swift
//  rule
//
//  Created by wenyuzhao on 4/20/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

class Card  {
   
    var contents: String? = nil
    var choosen = true
    var matched = false
   
   func match(otherCards:Array<Card>) -> Int {
      var score = 0
      for card in otherCards {
         if self.contents == card.contents {
            score = 1
         }
      }
      return score
   }
}