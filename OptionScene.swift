//
//  OptionScene.swift
//  Liam 9.0
//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//
import SpriteKit

class OptionScene: SKScene {
    
    private var easyBtn: SKSpriteNode?;
    private var mediumBtn: SKSpriteNode?;
    private var hardBtn: SKSpriteNode?;
    
    private var sign: SKSpriteNode?;
    
    override func didMoveToView(view: SKView) {
        initializeVariables();
        setSign();
    }
    
    func initializeVariables() {
        easyBtn = self.childNodeWithName("Easy Button") as? SKSpriteNode!;
        mediumBtn = self.childNodeWithName("Medium Button") as? SKSpriteNode!;
        hardBtn = self.childNodeWithName("Hard Button") as? SKSpriteNode!;
        sign = self.childNodeWithName("Sign") as? SKSpriteNode!;
    }
    
    func setSign() {
        if GameManager.instance.getEasyDifficulty() == true {
            sign?.position.y = (easyBtn?.position.y)!;
        } else if GameManager.instance.getMediumDifficulty() == true {
            sign?.position.y = (mediumBtn?.position.y)!;
        } else if GameManager.instance.getHardDifficulty() == true {
            sign?.position.y = (hardBtn?.position.y)!;
        }
    }
    
    private func setDifficulty(difficulty: String) {
        switch(difficulty) {
            case "easy":
                GameManager.instance.setEasyDifficulty(true);
                GameManager.instance.setMediumDifficulty(false);
                GameManager.instance.setHardDifficulty(false);
                break;
            
            case "medium":
                GameManager.instance.setEasyDifficulty(false);
                GameManager.instance.setMediumDifficulty(true);
                GameManager.instance.setHardDifficulty(false);
                break;
            
            case "hard":
                GameManager.instance.setEasyDifficulty(false);
                GameManager.instance.setMediumDifficulty(false);
                GameManager.instance.setHardDifficulty(true);
                break;
            
            default:
                break;
        }
        GameManager.instance.saveData();
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
        
            let location = touch.locationInNode(self);
            
            if nodeAtPoint(location) == easyBtn {
                sign?.position.y = (easyBtn?.position.y)!;
                setDifficulty("easy");
            }
            
            if nodeAtPoint(location) == mediumBtn {
                sign?.position.y = (mediumBtn?.position.y)!;
                setDifficulty("medium");
            }
            
            if nodeAtPoint(location) == hardBtn {
                sign?.position.y = (hardBtn?.position.y)!;
                setDifficulty("hard");
            }
            
            sign?.zPosition = 4;
            
            if nodeAtPoint(location).name == "Back" {
                let scene = MainMenuScene(fileNamed: "MainMenu");
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVerticalWithDuration(1));
            }

            
        }
        
    }
    
}































