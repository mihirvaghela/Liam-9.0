//
//  MainMenuScene.swift
//  Liam 9.0
//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    private var musicBtn: SKSpriteNode?;
    private let musicOn = SKTexture(imageNamed: "Music On Button");
    private let musicOff = SKTexture(imageNamed: "Music Off Button");
    
    override func didMoveToView(view: SKView) {
        musicBtn = self.childNodeWithName("Music") as? SKSpriteNode!;
        GameManager.instance.initializeGameData();
        setMusic();
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.locationInNode(self);
            
            if nodeAtPoint(location).name == "Start Game" {
                
                GameManager.instance.gameStartedFromMainMenu = true;
                
                let scene = GameplayScene(fileNamed: "GameplayScene");
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVerticalWithDuration(1.5));
                
            }
            
            if nodeAtPoint(location).name == "Highscore" {
                
                let scene = HighscoreScene(fileNamed: "HighscoreScene");
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVerticalWithDuration(1.5));
                
            }
            
            if nodeAtPoint(location).name == "Option" {
                
                let scene = OptionScene(fileNamed: "OptionScene");
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVerticalWithDuration(1.5));
                
            }
            
            if nodeAtPoint(location) == musicBtn {
                handleMusicButton();
            }
            
        }
        
    }
    
    private func setMusic() {
        if GameManager.instance.getIsMusicOn() {
            
            if AudioManager.instance.isAudioPlayerInitialized() {
                AudioManager.instance.playBGMusic();
                musicBtn?.texture = musicOff;
            }
        }
    }
    
    private func handleMusicButton() {
        if GameManager.instance.getIsMusicOn() {
            // the music is playing, turn it off
            AudioManager.instance.stopBGMusic();
            GameManager.instance.setIsMusicOn(false);
            musicBtn?.texture = musicOn;
        } else {
            // the music is not playing, turn it on
            AudioManager.instance.playBGMusic();
            GameManager.instance.setIsMusicOn(true);
            musicBtn?.texture = musicOff;
        }
        GameManager.instance.saveData();
    }

}





























