//
//  ViewController.swift
//  TicTacoToe-swift
//
//  Created by Cor Pruijs on 08-07-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet strong var levelField0: UIButton = UIButton()
    @IBOutlet strong var levelField1: UIButton = UIButton()
    @IBOutlet strong var levelField2: UIButton = UIButton()
    @IBOutlet strong var levelField3: UIButton = UIButton()
    @IBOutlet strong var levelField4: UIButton = UIButton()
    @IBOutlet strong var levelField5: UIButton = UIButton()
    @IBOutlet strong var levelField6: UIButton = UIButton()
    @IBOutlet strong var levelField7: UIButton = UIButton()
    @IBOutlet strong var levelField8: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func levelFieldPressed(sender: UIButton) {
        println(sender.restorationIdentifier)
        if let buttonName = sender.restorationIdentifier? {
            switch buttonName {
                case "lf0": levelField0.backgroundColor = UIColor.redColor()
                case "lf1": levelField1.backgroundColor = UIColor.redColor()
                case "lf2": levelField2.backgroundColor = UIColor.redColor()
                case "lf3": levelField3.backgroundColor = UIColor.redColor()
                case "lf4": levelField4.backgroundColor = UIColor.redColor()
                case "lf5": levelField5.backgroundColor = UIColor.redColor()
                case "lf6": levelField6.backgroundColor = UIColor.redColor()
                case "lf7": levelField7.backgroundColor = UIColor.redColor()
                case "lf8": levelField8.backgroundColor = UIColor.redColor()
                default: println("ERROR: invalid sender.restorationIdentifier")
            }
        }
    }
    
}