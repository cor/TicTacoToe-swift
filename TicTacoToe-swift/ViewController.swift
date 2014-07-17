//
//  ViewController.swift
//  TicTacoToe-swift
//
//  Created by Cor Pruijs on 08-07-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //without collection
    @IBOutlet strong var levelField0: UIButton = UIButton()
    @IBOutlet strong var levelField1: UIButton = UIButton()
    @IBOutlet strong var levelField2: UIButton = UIButton()
    @IBOutlet strong var levelField3: UIButton = UIButton()
    @IBOutlet strong var levelField4: UIButton = UIButton()
    @IBOutlet strong var levelField5: UIButton = UIButton()
    @IBOutlet strong var levelField6: UIButton = UIButton()
    @IBOutlet strong var levelField7: UIButton = UIButton()
    @IBOutlet strong var levelField8: UIButton = UIButton()
    @IBOutlet strong var currentPlayerLabel: UILabel
    
    
    //the collection that causes the self.currentPlayerLabel not initalized at super.init call error
    @IBOutlet var levelField: Array<UIButton>
  
    
    var level = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    // can be 1 or 2
    var currentPlayer = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        levelField[2].backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func levelFieldPressed(sender: UIButton) {
        if let buttonName = sender.restorationIdentifier? {
            println(sender.restorationIdentifier! + " pressed")
            self.setValue(UIColor.redColor(), forKeyPath: "self.levelField\(Array(buttonName)[2]).backgroundColor")
        }
    }
}