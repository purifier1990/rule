//
//  Utils.swift
//  rule
//
//  Created by wenyuzhao on 5/9/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import Foundation
class Utils: PlayCard {
   class func isPrime(card: PlayCard) -> Bool {
      if card.rank == 2 || card.rank == 3 || card.rank == 5 || card.rank == 7 || card.rank == 11 || card.rank == 13 {
         return true
      } else {
         return false
      }
   }
   
   class func isThirdCard(index:Int) -> Bool {
      if index == 2 || index == 6 || index == 10 || index == 14 {
         return true
      } else {
         return false
      }
   }
}