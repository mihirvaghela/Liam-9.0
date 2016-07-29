//
//  AudioManager.swift

//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//

import AVFoundation

class AudioManager {
    
    static let instance = AudioManager();
    private init() {}
    
    private var audioPlayer: AVAudioPlayer?;
    
    func playBGMusic() {
    
        let url = NSBundle.mainBundle().URLForResource("Background music", withExtension: "mp3");
        
        var err: NSError?;
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOfURL: url!);
            audioPlayer?.numberOfLoops = -1;
            audioPlayer?.prepareToPlay();
            audioPlayer?.play();
            
        } catch let err1 as NSError {
            err = err1;
        }
        
        if err != nil {
            print("we have a problem");
        }
        
    }
    
    func stopBGMusic() {
        if ((audioPlayer?.playing) != nil) {
            audioPlayer?.stop();
        }
    }
    
    func isAudioPlayerInitialized() -> Bool {
        return audioPlayer == nil;
    }
    
}








































