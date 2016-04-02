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
        setInitPlayerTurnLabel()
        
    }
    
    func randomGenerator(limit: UInt32) -> Int {
        return Int(arc4random_uniform(limit))
    }
    
    func processTurn() {
        if playerTurn == 0 {
            _gameLabel = "\(playerOne.name) attacked \(playerTwo.name) for \(playerOne.attPwr) HP!"
            processAttack(playerTurn)
            _playerTurn = 1
        } else {
            _gameLabel = "\(playerTwo.name) attacked \(playerOne.name) for \(playerTwo.attPwr) HP!"
            processAttack(playerTurn)
            _playerTurn = 0
        }
    }
    
    private func processAttack(turn: Int) {
        if turn == 0 {
            playerTwo.hp -= playerOne.attPwr
        } else {
            playerOne.hp -= playerTwo.attPwr
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
    
    

}