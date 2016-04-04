//
//  Game.swift
//  ios-awesome-game
//
//  Created by mobilestudio on 4/1/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import Foundation
import AVFoundation

class Game {
    
    private var _playerTurn: Int!
    private var _playerOne: Villain!
    private var _playerTwo: Hero!
    private var _gameLabel: String!
    private var _pwrAtkChance: Int?
    private var _defChance: Int?
    private var _attackSound: AVAudioPlayer!
    private var _bgm: AVAudioPlayer!
    
    
    var playerOne: Villain {
        get {
            return _playerOne
        }
    }
    
    var playerTwo: Hero {
        get {
            return _playerTwo
        }
    }
    
    var playerTurn: Int {
        get {
            return _playerTurn
        }
    }
    
    var gameLabel: String {
        get {
            return _gameLabel
        }
    }
    
    init() {
        _playerOne = Villain(newHp: 90, newAttPwr: 10, newName: "Monster")
        _playerTwo = Hero(newHp: 120, newAttPwr: 5, newName: "Knight")
        _playerTurn = randomGenerator(2)
        setInitPlayerTurnLabel()
        _pwrAtkChance = randomGenerator(6) + 1
        _defChance = randomGenerator(6) + 1
        
        let attackSoundPath = NSBundle.mainBundle().pathForResource("bgm", ofType: "wav")
        let attackSoundURL = NSURL(fileURLWithPath: attackSoundPath!)
        
        do {
            try _bgm = AVAudioPlayer(contentsOfURL: attackSoundURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func randomGenerator(limit: UInt32) -> Int {
        return Int(arc4random_uniform(limit))
    }
    
    func processTurn() {
        var tempDamage = 0
        var tempBonusRoll: Int = randomGenerator(6) + 1
        
        if playerTurn == 0 {
            if tempBonusRoll == _pwrAtkChance! {
                playerOne.powerAttackFlag = true
            }
            if tempBonusRoll == _defChance! {
                playerTwo.defenseFlag = true
            }
            tempDamage = processAttack(playerTurn)
            playerOne.powerAttackFlag = false
            playerTwo.defenseFlag = false
            if (playerTwo.hp <= 0) {
                playerTwo.isAlive = false
                _gameLabel = "\(playerOne.name) is victorious!"
            }
            else {
               _gameLabel = "\(playerOne.name) attacked \(playerTwo.name) for \(tempDamage) HP!"
            }
            
            _playerTurn = 1
        } else {
            tempDamage = processAttack(playerTurn)
            playerOne.powerAttackFlag = false
            playerTwo.defenseFlag = false
            if (playerOne.hp <= 0) {
                playerOne.isAlive = false
                _gameLabel = "\(playerTwo.name) is victorious!"
            }
            _gameLabel = "\(playerTwo.name) attacked \(playerOne.name) for \(tempDamage) HP!"
            
            _playerTurn = 0
        }
    }
    
    private func processAttack(turn: Int) -> Int {
        
        var tempDamage: Int = 0
        
        if turn == 0 {
            if (playerOne.powerAttackFlag) {
               tempDamage = playerOne.attPwr * 2
                playerTwo.hp -= tempDamage
                return tempDamage
            } else if (playerTwo.defenseFlag) {
                tempDamage = playerOne.attPwr / 2
                playerTwo.hp -= tempDamage
                return tempDamage
            } else {
                tempDamage = playerOne.attPwr
                playerTwo.hp -= tempDamage
                return tempDamage
            }
            
        } else {
            tempDamage = playerTwo.attPwr
            playerOne.hp -= tempDamage
            return tempDamage
        }
        
    }
    
    private func setInitPlayerTurnLabel() {
        if playerTurn == 0 {
            _gameLabel = "\(playerOne.name) goes first!"
        }
        else {
            _gameLabel = "\(playerTwo.name) goes first!"
        }
    }
    
    func playMusic() {
        if _bgm.playing {
            _bgm.stop()
        }
        else {
            _bgm.play()
        }
    }
    
    
    
    

}