//
//  ViewController.swift
//  TicTacoToe-swift
//
//  Created by Cor Pruijs on 08-07-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum player {
        case Cross
        case Nought
    }
    
    @IBOutlet strong var levelField0: UIButton = UIButton()
    @IBOutlet strong var levelField1: UIButton = UIButton()
    @IBOutlet strong var levelField2: UIButton = UIButton()
    @IBOutlet strong var levelField3: UIButton = UIButton()
    @IBOutlet strong var levelField4: UIButton = UIButton()
    @IBOutlet strong var levelField5: UIButton = UIButton()
    @IBOutlet strong var levelField6: UIButton = UIButton()
    @IBOutlet strong var levelField7: UIButton = UIButton()
    @IBOutlet strong var levelField8: UIButton = UIButton()
    
    var currentPlayer = player.Nought
    var level = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func levelFieldPressed(sender: UIButton) {
        println("\(sender.restorationIdentifier) pressed")
        
        if let buttonName = sender.restorationIdentifier? {
            switch currentPlayer {
            case .Cross:
                self.setValue(UIColor.redColor(), forKeyPath: "self.levelField\(Array(buttonName)[2]).backgroundColor")
            case .Nought:
                self.setValue(UIColor.blueColor(), forKeyPath: "self.levelField\(Array(buttonName)[2]).backgroundColor")
            }
            
        }
        
        if self.currentPlayer == .Cross {
            currentPlayer = .Nought
            println("currentPlayer is now Nought")
        } else if self.currentPlayer == .Nought{
            currentPlayer = .Cross
            println("currentPlayer is now Cross")
        }
    
    }
    
}