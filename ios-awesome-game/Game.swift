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
    private var _playerOne: Character!
    private var _playerTwo: Character!
    private var _gameText: [String: String]!
    private var _gameLabel: String!
    
    
    var playerOne: Character {
        get {
            return _playerOne
        }
    }
    
    var playerTwo: Character {
        get {
            return _playerTwo
        }
    }
    
    var playerTurn: Int {
        get {
            return _playerTurn
        }
    }
    
    var gameText: [String: String] {
        get {
            return _gameText
        } set {
            _gameText = newValue
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
        setPlayerTurnLabel()
        
    }
    
    func randomGenerator(limit: UInt32) -> Int {
        return Int(arc4random_uniform(limit))
    }
    
    func processTurn() {
        
    }
    
    private func processAttack() {
        
    }
    
    private func setPlayerTurnLabel() {
        if playerTurn == 0 {
            _gameLabel = "\(playerOne.name)'s turn"
        }
        else {
            _gameLabel = "\(playerTwo.name)'s turn"
        }
    }
    
    

}