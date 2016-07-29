//
//  GameplayController.swift
//  Liam 9.0
//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//
import Foundation
import SpriteKit

class GameplayController {
    
    static let instance = GameplayController();
    private init() {}
    
    var scoreText: SKLabelNode?;
    var coinText: SKLabelNode?;
    var lifeText: SKLabelNode?;
    
    var score: Int32?;
    var coin: Int32?;
    var life: Int32?;
    
    func initializeVariables() {
    
        if GameManager.instance.gameStartedFromMainMenu {
            
            GameManager.instance.gameStartedFromMainMenu = false;
            
            score = -1;
            coin = 0;
            life = 2;
            
            scoreText?.text = "\(score!)";
            coinText?.text = "x\(coin!)";
            lifeText?.text = "x\(life!)";
            
        } else if GameManager.instance.gameRestartedPlayerDied {
            
            GameManager.instance.gameRestartedPlayerDied = false;
            
            scoreText?.text = "\(score!)";
            coinText?.text = "x\(coin!)";
            lifeText?.text = "x\(life!)";
        }
        
    }
    
    func incrementScore() {
        score!++;
        scoreText?.text = "\(score!)"
    }
    
    func incrementCoin() {
        coin!++;
        score! += 200;
        
        scoreText?.text = "\(score!)";
        coinText?.text = "x\(coin!)";
    }
    
    func incrementLife() {
        life!++;
        score! += 300;
        
        print("life is increment and now is \(life)");
        
        scoreText?.text = "\(score!)"
        lifeText?.text = "x\(life!)"
    }
    
    
}











































