//
//  ViewController.swift
//  rule
//
//  Created by wenyuzhao on 4/20/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var game:CardMatchingGame?
   var deck:Deck?
   let rule = [
      1:"ascending",
      2:"prime",
      3:"colume3"
   ]
   var currentRule = 1
   var currentRound = 1
   var roundCount = 1
   
   @IBOutlet var cardButtons: [UIButton]!

   init() {
      super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }
   
   func createDeck() -> Deck? {
      return nil
   }
   
   override func viewDidLoad() {
    
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.game = CardMatchingGame.init(count:cardButtons.count, deck:createDeck()!)
      updateUI()
      let nc = NSNotificationCenter.defaultCenter()
      nc.addObserver(self, selector: #selector(ViewController.updateDeck(_:)), name: "needUpdateDeck", object: nil)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   func updateDeck(notification:NSNotification) {
      roundCount -= 1
      self.game = CardMatchingGame.init(count:cardButtons.count, deck:createDeck()!)
      updateUI()
      if currentRound == 3 && roundCount == 0 {
         currentRound = 1
         roundCount = 1
         currentRule = 1
      } else if roundCount == 0 {
         currentRound += 1
         roundCount = currentRound
         currentRule = currentRound
      } else {
         currentRule -= 1
      }
   }
    
   func updateUI() {
      var isDone = true
      for cardButton in cardButtons {
         let cardIndex = cardButtons.indexOf(cardButton)
         let card = game!.cardAtIndex(cardIndex!)
         cardButton.setTitle(self.titleForCard(card!) as String, forState:UIControlState.Normal)
         cardButton.setBackgroundImage(self.backgroundImageForCard(card!), forState: UIControlState.Normal)
         cardButton.enabled = !card!.matched
         if !card!.matched {
            isDone = false
         }
      }
      if isDone {
         let nc = NSNotificationCenter.defaultCenter()
         nc.postNotificationName("needUpdateDeck", object: nil)
      }
   }
   
   func checkRuleForRemainingCards(rule:Int) -> Bool {
      switch rule {
      case 1:
         return true
      case 2:
         for card in self.game!.cards as! Array<PlayCard> {
            if (card.rank == 2 && card.matched == false) || (card.rank == 3 && card.matched == false) || (card.rank == 5 && card.matched == false) || (card.rank == 7 && card.matched == false) || (card.rank == 11 && card.matched == false) || (card.rank == 13 && card.matched == false) {
               return true
            }
         }
         return false
      case 3:
         var index = 0
         for card in self.game!.cards as! Array<PlayCard> {
            if (index == 2 && !card.matched) || (index == 6 && !card.matched) || (index == 10 && !card.matched) || (index == 14 && !card.matched) {
               return true
            }
            index += 1
         }
         return false
      default:
         return false
      }
   }
   
   @IBAction func touchButton(sender: UIButton) {
      let cardIndex = cardButtons.indexOf(sender)
      game!.chooseCardAtIndex(cardIndex!, byRule: currentRule)
      updateUI()
      if !checkRuleForRemainingCards(currentRule) {
         currentRule -= 1
         roundCount -= 1
      }
   }

   func titleForCard(card:Card) -> NSString {
      return card.choosen ? card.contents! : ""
   }
   
   func backgroundImageForCard(card:Card) -> UIImage {
      return UIImage.init(named: card.choosen ? "front" : "back")!
   }
}

