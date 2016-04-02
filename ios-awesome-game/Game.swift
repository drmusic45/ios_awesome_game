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
        } set {
            _playerOne = newValue
        }
    }
    
    var playerTwo: Character {
        get {
            return _playerTwo
        } set {
            _playerTwo = newValue
        }
    }
    
    var playerTurn: Int {
        get {
            return _playerTurn
        } set {
            _playerTurn = newValue
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
        playerOne = Villain(newHp: 90, newAttPwr: 10, newName: "Monster")
        playerTwo = Hero(newHp: 120, newAttPwr: 5, newName: "Knight")
        playerTurn = randomGenerator(2)
    }
    
    func randomGenerator(limit: UInt32) -> Int {
        return Int(arc4random_uniform(limit))
    }
    
    func processTurn() {
        
    }
    
    private func processAttack() {
        
    }
    
    

}