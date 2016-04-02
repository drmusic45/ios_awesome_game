//
//  Villain.swift
//  ios-awesome-game
//
//  Created by mobilestudio on 4/1/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import Foundation

class Villain: Character {
    
    private var _powerAttackFlag: Bool!
    
    var powerAttackFlag: Bool {
        get {
            return _powerAttackFlag
        } set {
            _powerAttackFlag = newValue
        }
    }
    
    override init(newHp: Int, newAttPwr: Int, newName: String) {
        super.init(newHp: newHp, newAttPwr: newAttPwr, newName: newName)
        self.powerAttackFlag = false
        
    }
}