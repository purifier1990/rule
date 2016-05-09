//
//  ViewController.swift
//  rule
//
//  Created by wenyuzhao on 4/20/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   let updateDeckNotificaton = "needUpdateDeck"
   let maxRound = 3
   
   var game:CardMatchingGame?
   var deck:Deck?
   var ruleEngie:Rule?
   
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
      ruleEngie = Rule()
      updateUI()
      let nc = NSNotificationCenter.defaultCenter()
      nc.addObserver(self, selector: #selector(ViewController.updateDeck(_:)), name: updateDeckNotificaton, object: nil)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   func updateDeck(notification:NSNotification) {
      roundCount -= 1
      self.game = CardMatchingGame.init(count:cardButtons.count, deck:createDeck()!)
      updateUI()
      if currentRound == maxRound && roundCount == 0 {
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
         nc.postNotificationName(updateDeckNotificaton, object: nil)
      }
   }
   
   @IBAction func touchButton(sender: UIButton) {
      let cardIndex = cardButtons.indexOf(sender)
      game!.chooseCardAtIndex(cardIndex!, byRule: currentRule)
      updateUI()
      if !(ruleEngie!.checkRule(currentRule, forRemainingCards:self.game!.cards as! Array<PlayCard>)) {
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

