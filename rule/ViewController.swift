//
//  ViewController.swift
//  rule
//
//  Created by wenyuzhao on 4/20/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var game = CardMatchingGame().init(count:self.cardButtons.count, deck:self.createDeck()!)
   var deck:Deck

   @IBOutlet var cardButtons: [UIButton]!
   
   init() {
      self.deck = self.createDeck()!
      game = CardMatchingGame.init(count:self.cardButtons.count, deck:self.createDeck()!)
   }
   
   required init?(coder aDecoder: NSCoder) {
      
   }
   
   func createDeck() -> Deck? {
      return nil
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   func updateUI() {
      for cardButton in cardButtons {
         let cardIndex = cardButtons.indexOf(cardButton)
         let card = game.cardAtIndex(cardIndex!)
         cardButton.setTitle(self.titleForCard(card!) as String, forState:UIControlState.Normal)
         cardButton.setBackgroundImage(self.backgroundImageForCard(card!), forState: UIControlState.Normal)
         cardButton.enabled = !card!.matched
      }
   }
   
   @IBAction func touchButton(sender: UIButton) {
      let cardIndex = cardButtons.indexOf(sender)
      game.chooseCardAtIndex(cardIndex!)
   }

   func titleForCard(card:Card) -> NSString {
      return card.choosen ? card.contents! : ""
   }
   
   func backgroundImageForCard(card:Card) -> UIImage {
      return UIImage.init(named: card.choosen ? "front" : "back")!
   }
}

