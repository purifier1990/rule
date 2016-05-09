//
//  Rule.swift
//  Rule
//
//  Created by wenyuzhao on 5/9/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import Foundation

class Rule {
   //var rules = [Int:String]()
   let rule = [
      1:"ascending",
      2:"prime",
      3:"colume3"
   ]
   
   func checkRule(rule:Int, forRemainingCards cards:Array<PlayCard>) -> Bool {
      func validateAscending() -> Bool {
         return true
      }
      
      func validatePrime() -> Bool {
         for card in cards {
            if (card.matched == false) && (Utils.isPrime(card)) {
               return true
            }
         }
         return false
      }
      
      func validateThirdColume() -> Bool {
         var index = 0
         for card in cards {
            if !card.matched && Utils.isThirdCard(index) {
               return true
            }
            index += 1
         }
         return false
      }
      
      switch rule {
      case 1:
         return validateAscending()
      case 2:
         return validatePrime()
      case 3:
         return validateThirdColume()
      default:
         return false
      }
   }

   
//   func addRule() {
//      
//   }
}