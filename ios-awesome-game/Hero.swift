//
//  Hero.swift
//  ios-awesome-game
//
//  Created by mobilestudio on 4/1/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import Foundation

class Hero: Character {
    
    private var _defenseFlag: Bool!
    
    var defenseFlag: Bool {
        get {
            return _defenseFlag
        } set {
            _defenseFlag = newValue
        }
    }
    
    override init(newHp: Int, newAttPwr: Int, newName: String) {
        super.init(newHp: newHp, newAttPwr: newAttPwr, newName: newName)
        self.defenseFlag = false
    }
}