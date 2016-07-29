//
//  GameController.swift
//  Liam 9.0
//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//

import Foundation

class GameManager {
    
    static let instance = GameManager();
    private init() {}
    
    private var gameData: GameData?;
    
    var gameStartedFromMainMenu = false;
    var gameRestartedPlayerDied = false;
    
    func initializeGameData() {
        
        if !NSFileManager.defaultManager().fileExistsAtPath(getFilePath() as String) {
            // setup our game with initial values
            gameData = GameData();
            
            gameData?.setEasyDifficultyScore(0);
            gameData?.setEasyDifficultyCoinScore(0);
            
            gameData?.setMediumDifficultyScore(0);
            gameData?.setMediumDifficultyCoinScore(0);
            
            gameData?.setHardDifficultyScore(0);
            gameData?.setHardDifficultyCoinScore(0);
            
            gameData?.setEasyDifficulty(false);
            gameData?.setMediumDifficulty(true);
            gameData?.setHardDifficulty(false);
            
            gameData?.setIsMusicOn(false);
            
            saveData();
        }
        
        loadData();
        
    }
    
    func loadData() {
        gameData = NSKeyedUnarchiver.unarchiveObjectWithFile(getFilePath() as String) as? GameData!
    }
    
    func saveData() {
        if gameData != nil {
            NSKeyedArchiver.archiveRootObject(gameData!, toFile: getFilePath() as String);
        }
    }
    
    private func getFilePath() -> String {
        let manager = NSFileManager.defaultManager();
        let url = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as NSURL!;
        return url!.URLByAppendingPathComponent("Game Data").path!;
    }
    
    func setEasyDifficultyScore(easyDifficultyScore: Int32) {
        gameData!.setEasyDifficultyScore(easyDifficultyScore);
    }
    
    func setEasyDifficultyCoinScore(easyDifficultyCoinScore: Int32) {
        gameData!.setEasyDifficultyCoinScore(easyDifficultyCoinScore);
    }
    
    func getEasyDifficultyScore() -> Int32 {
        return gameData!.getEasyDifficultyScore();
    }
    
    func getEasyDifficultyCoinScore() -> Int32 {
        return gameData!.getEasyDifficultyCoinScore();
    }
    
    func setMediumDifficultyScore(mediumDifficultyScore: Int32) {
        gameData!.setMediumDifficultyScore(mediumDifficultyScore);
    }
    
    func setMediumDifficultyCoinScore(mediumDifficultyCoinScore: Int32) {
        gameData!.setMediumDifficultyCoinScore(mediumDifficultyCoinScore);
    }
    
    func getMediumDifficultyScore() -> Int32 {
        return gameData!.getMediumDifficultyScore();
    }
    
    func getMediumDifficultyCoinScore() -> Int32 {
        return gameData!.getMediumDifficultyCoinScore();
    }
    
    func setHardDifficultyScore(hardDifficultyScore: Int32) {
        gameData!.setHardDifficultyScore(hardDifficultyScore);
    }
    
    func setHardDifficultyCoinScore(hardDifficultyCoinScore: Int32) {
        gameData!.setHardDifficultyCoinScore(hardDifficultyCoinScore);
    }
    
    func getHardDifficultyScore() -> Int32 {
        return gameData!.getHardDifficultyScore();
    }
    
    func getHardDifficultyCoinScore() -> Int32 {
        return gameData!.getHardDifficultyCoinScore();
    }
    
    func setEasyDifficulty(easyDifficulty: Bool) {
        gameData!.setEasyDifficulty(easyDifficulty);
    }
    
    func getEasyDifficulty() -> Bool {
        return gameData!.getEasyDifficulty();
    }
    
    func setMediumDifficulty(mediumDifficulty: Bool) {
        gameData!.setMediumDifficulty(mediumDifficulty);
    }
    
    func getMediumDifficulty() -> Bool {
        return gameData!.getMediumDifficulty();
    }
    
    func setHardDifficulty(hardDifficulty: Bool) {
        gameData!.setHardDifficulty(hardDifficulty);
    }
    
    func getHardDifficulty() -> Bool {
        return gameData!.getHardDifficulty();
    }
    
    func setIsMusicOn(isMusicOn: Bool) {
        gameData!.setIsMusicOn(isMusicOn);
    }
    
    func getIsMusicOn() -> Bool {
        return gameData!.getIsMusicOn();
    }
    
}






































