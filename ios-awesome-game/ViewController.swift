//
//  ViewController.swift
//  ios-awesome-game
//
//  Created by mobilestudio on 4/1/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerOneImage: UIImageView!
    @IBOutlet weak var playerTwoImage: UIImageView!
    
    @IBOutlet weak var playerOneHPLabel: UILabel!
    @IBOutlet weak var playerTwoHPLabel: UILabel!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var playerOneAtkBtn: UIButton!
    @IBOutlet weak var playerTwoAtkBtn: UIButton!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = Game()
        updateLabel("displayLabel")
        updateLabel("playerOneHP")
        updateLabel("playerTwoHP")
        if game.playerTurn == 0 {
            playerTwoAtkBtn.hidden = true
        } else {
            playerOneAtkBtn.hidden = true
        }
        game.playMusic()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPlayerOneAttackPressed(sender: AnyObject) {
        //logic
        playerOneAtkBtn.hidden = true
        playerTwoAtkBtn.hidden = false
        game.processTurn()
        updateLabel("displayLabel")
        updateLabel("playerTwoHP")
        if (!game.playerTwo.isAlive) {
            playerTwoImage.hidden = true
            playerTwoAtkBtn.hidden = true
        }
        
    }
    
    @IBAction func onPlayerTwoAttackPressed(sender: AnyObject) {
        playerOneAtkBtn.hidden = false
        playerTwoAtkBtn.hidden = true
        game.processTurn()
        updateLabel("displayLabel")
        updateLabel("playerOneHP")
        if (!game.playerOne.isAlive) {
            playerOneImage.hidden = true
            playerOneAtkBtn.hidden = true
        }
        
    }
    
    func updateLabel(labelName: String) {
        switch (labelName) {
        case "displayLabel":
            displayLabel.text = game.gameLabel
        case "playerOneHP":
            playerOneHPLabel.text = "\(game.playerOne.hp) HP"
        case "playerTwoHP":
            playerTwoHPLabel.text = "\(game.playerTwo.hp) HP"
        default:
            displayLabel.text = "No news here"
            }
        }

}

