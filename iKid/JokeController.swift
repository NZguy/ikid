//
//  JokeController.swift
//  iKid
//
//  Created by Duncan Andrew on 4/26/17.
//  Copyright © 2017 Duncan Andrew. All rights reserved.
//

import UIKit

class JokeController: NSObject {

    let jokes = [
        ["It was an emotional wedding", "Even the cake was in tiers 🎂", "Did you hear the joke about the German sausage?", "It was the wurst 🌭", "Yesterday a clown held the door open for me", "I thought it was s nice Jester 🤡"],
        ["What time did the man go to the dentist?", "Tooth hurt-y", "A ham sandwich walks into a bar and orders a beer", "Bartender says, \"Sorry we don't serve food here\"", "Why do chicken coops only have two doors?", "Because if they had four, they would be chicken sedans!"],
        ["Knock knock", "Who's there?", "Little old lady", "Little old lady who?", "I didn't know you could yodel 😆", "Knock knock", "Who’s there?", "Etch", "Etch who?", "Bless you 🤥"]
    ]
    
    var x: Int
    var y: Int
    static let sharedInstance = JokeController()
    
    private override init(){
        self.x = 0
        self.y = 0
        
        super.init()
    }
    
    
}
