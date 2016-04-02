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
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = Game()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPlayerOneAttackPressed(sender: AnyObject) {
    }
    
    @IBAction func onPlayerTwoAttackPressed(sender: AnyObject) {
    }

}

