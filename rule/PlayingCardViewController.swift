//
//  PlayingCardViewController.swift
//  rule
//
//  Created by wenyuzhao on 4/29/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import UIKit

class PlayingCardViewController: ViewController {
   override func createDeck() -> Deck {
      return PlayingCardDeck()
   }
}
