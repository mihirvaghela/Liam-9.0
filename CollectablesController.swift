//
//  CollectablesController.swift
//  Liam 9.0
//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//

import SpriteKit

class CollectablesController {

    func getCollectable() -> SKSpriteNode {
        
        var collectable = SKSpriteNode();
        
        if Int(randomBetweenNumbers(0, secondNum: 7)) >= 4 {
            
            if GameplayController.instance.life < 2 {
                
                collectable = SKSpriteNode(imageNamed: "Life");
                collectable.name = "Life";
                collectable.physicsBody = SKPhysicsBody(rectangleOfSize: collectable.size);
                
            } else {
                collectable.name = "Empty";
            }
            
        } else {
            
            collectable = SKSpriteNode(imageNamed: "Coin");
            collectable.name = "Coin";
            collectable.physicsBody = SKPhysicsBody(circleOfRadius: collectable.size.height / 2);
            
        }
        
        collectable.physicsBody?.affectedByGravity = false;
        collectable.physicsBody?.categoryBitMask = ColliderType.DarkCloudAndCollectables;
        collectable.physicsBody?.collisionBitMask = ColliderType.Player;
        collectable.zPosition = 2;
        
        return collectable;
        
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum);
    }

}







































