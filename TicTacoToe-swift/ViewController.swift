//
//  ViewController.swift
//  TicTacoToe-swift
//
//  Created by Cor Pruijs on 08-07-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Not using IBOutletCollection because it doesn't have swift support
 
    @IBOutlet strong var levelFieldImage0: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage1: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage2: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage3: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage4: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage5: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage6: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage7: UIImageView = UIImageView()
    @IBOutlet strong var levelFieldImage8: UIImageView = UIImageView()
    
    
    @IBOutlet strong var currentPlayerLabel: UILabel = UILabel()
    @IBOutlet strong var gamewinnerLabel: UILabel = UILabel()
    
    enum Player {
        case Cross
        case Nought
    }
    
    enum LevelState {
        case Cross
        case Nought
        case Empty
    }
    
    
    var currentPlayer = Player.Nought
    var gamewinner: Player?
    var level: [LevelState] = [.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty]
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
                            //[[------Horizontal------]]  [[-------Vertical------]]  [[--Diagonal---]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLevel()
    }
    
    @IBAction func levelFieldPressed(sender: UIButton) {
        println("\(sender.restorationIdentifier) pressed")
        
        if self.gamewinner == nil {
        
            if let buttonNumber = sender.restorationIdentifier? {
                switch self.currentPlayer {
                case .Nought:
                    if level[String(Array(buttonNumber)[2]).toInt()!] == .Empty {
                        level[String(Array(buttonNumber)[2]).toInt()!] = .Nought
                    }
                case .Cross:
                    if level[String(Array(buttonNumber)[2]).toInt()!] == .Empty {
                        level[String(Array(buttonNumber)[2]).toInt()!] = .Cross
                    }
                }
            }
            
            self.switchPlayer()
            self.checkForVictory()
            self.updateLevel()
        
        }
    }
    
    func updateLevel() {
        for i in 0..<level.count {
            switch self.level[i] {
            case .Empty:  self.setValue(UIImage(named: "Empty"),   forKeyPath: "self.levelFieldImage\(i).image")
            case .Cross:  self.setValue(UIImage(named: "Cross"),   forKeyPath: "self.levelFieldImage\(i).image")
            case .Nought: self.setValue(UIImage(named: "Nought"),  forKeyPath: "self.levelFieldImage\(i).image")
            }
        }
   
        
        switch self.currentPlayer {
        case .Cross:  self.currentPlayerLabel.text = "Cross"
        case .Nought: self.currentPlayerLabel.text = "Nought"
        }
        
        if let winner = self.gamewinner {
            switch winner {
            case .Cross:  self.gamewinnerLabel.text = "Cross wins!"
            case .Nought: self.gamewinnerLabel.text = "Nought wins!"
            }
        } else { self.gamewinnerLabel.text = "" }
    }
    
    func checkForVictory() {
        for i in winningCombinations {
            if level[i[0]] == LevelState.Cross && level[i[1]] == LevelState.Cross && level[i[2]] == LevelState.Cross {
                self.gamewinner = Player.Cross
            }
            
            if level[i[0]] == LevelState.Nought && level[i[1]] == LevelState.Nought && level[i[2]] == LevelState.Nought {
                self.gamewinner = Player.Nought
            }
        }
    }
    
    func switchPlayer(){
        if self.currentPlayer == .Cross {
            currentPlayer = .Nought
            println("currentPlayer is now Nought")
        } else if self.currentPlayer == .Nought{
            currentPlayer = .Cross
            println("currentPlayer is now Cross")
        }
    }
}