//
//  Character.swift
//  ios-awesome-game
//
//  Created by mobilestudio on 4/1/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int!
    private var _attPwr: Int!
    private var _name: String!
    private var _isAlive: Bool!
    
    var hp: Int {
        get {
            return _hp
        } set {
            _hp = newValue
        }
    }
    
    var attPwr: Int {
        get {
            return _attPwr
        } set {
            _attPwr = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
    
    var isAlive: Bool {
        get {
            return _isAlive
        } set {
            _isAlive = newValue
        }
    }
    
    init(newHp: Int, newAttPwr: Int, newName: String) {
        self.hp = newHp
        self.attPwr = newAttPwr
        self.name = newName
        self.isAlive = true
    }
}