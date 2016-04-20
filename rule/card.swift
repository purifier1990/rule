//
//  card.swift
//  rule
//
//  Created by wenyuzhao on 4/20/16.
//  Copyright © 2016 wenyuzhao. All rights reserved.
//

import UIKit

class card  {
   
    var contents: NSString
    var choosen: Bool
    var matched: Bool
   
    init(contents: NSString, choosen: Bool, matched: Bool) {
        self.contents = contents
        self.choosen = choosen
        self.matched = matched
    }
   
}