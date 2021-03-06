//
//  CloudsController.swift
//  Liam 9.0
//
//  Created by Ashish Desai on 2016-03-25.
//  Copyright (c) 2016 Ashish Desai. All rights reserved.
//
import SpriteKit

class CloudsController {
    
    let collectableController = CollectablesController();
    
    var lastCloudPositionY = CGFloat();
    
    func shuffle(var cloudsArray: [SKSpriteNode]) -> [SKSpriteNode] {
    
        for var i = cloudsArray.count - 1; i > 0; i-- {
            
            let j = Int(arc4random_uniform(UInt32(i - 1)));

            swap(&cloudsArray[i], &cloudsArray[j]);
            
        }
        
        return cloudsArray;
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {

        // arc4random returns a number between 0 to (2**32)-1
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum);
        
    }
    
    func createClouds() -> [SKSpriteNode] {
    
        var clouds = [SKSpriteNode]();
        
        for var i = 0; i < 2; i++ {
            let cloud1 = SKSpriteNode(imageNamed: "Cloud 1");
            cloud1.name = "1";
            let cloud2 = SKSpriteNode(imageNamed: "Cloud 2");
            cloud2.name = "2";
            let cloud3 = SKSpriteNode(imageNamed: "Cloud 3");
            cloud3.name = "3";
            let darkCloud = SKSpriteNode(imageNamed: "Dark Cloud");
            darkCloud.name = "Dark Cloud";
            
            cloud1.xScale = 0.9;
            cloud1.yScale = 0.9;
            
            cloud2.xScale = 0.9;
            cloud2.yScale = 0.9;
            
            cloud3.xScale = 0.9;
            cloud3.yScale = 0.9;
            
            darkCloud.xScale = 0.9;
            darkCloud.yScale = 0.9;
            
            // add physics bodies to the clouds
            cloud1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: cloud1.size.width - 9, height: cloud1.size.height - 7));
            cloud1.physicsBody?.affectedByGravity = false;
            cloud1.physicsBody?.restitution = 0;
            cloud1.physicsBody?.categoryBitMask = ColliderType.Cloud;
            cloud1.physicsBody?.collisionBitMask = ColliderType.Player;
            
            cloud2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: cloud2.size.width - 9, height: cloud2.size.height - 7));
            cloud2.physicsBody?.affectedByGravity = false;
            cloud2.physicsBody?.restitution = 0;
            cloud2.physicsBody?.categoryBitMask = ColliderType.Cloud;
            cloud2.physicsBody?.collisionBitMask = ColliderType.Player;
            
            cloud3.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: cloud3.size.width - 9, height: cloud3.size.height - 7));
            cloud3.physicsBody?.affectedByGravity = false;
            cloud3.physicsBody?.restitution = 0;
            cloud3.physicsBody?.categoryBitMask = ColliderType.Cloud;
            cloud3.physicsBody?.collisionBitMask = ColliderType.Player;
            
            darkCloud.physicsBody = SKPhysicsBody(rectangleOfSize: darkCloud.size);
            darkCloud.physicsBody?.affectedByGravity = false;
            darkCloud.physicsBody?.categoryBitMask = ColliderType.DarkCloudAndCollectables;
            darkCloud.physicsBody?.collisionBitMask = ColliderType.Player;
            
            clouds.append(cloud1);
            clouds.append(cloud2);
            clouds.append(cloud3);
            clouds.append(darkCloud);
            
        }
        
        clouds = shuffle(clouds);
        
        return clouds;
    }
    
    func arrangeCloudsInScene(let scene: SKScene, let distanceBetweenClouds: CGFloat, let center: CGFloat, let minX: CGFloat, let maxX: CGFloat, player: Player, let initialClouds: Bool) {
        
        var clouds = createClouds();
        
        if initialClouds {
            while(clouds[0].name == "Dark Cloud") {
                // shuffle the cloud array
                clouds = shuffle(clouds);
            }
        }
        
        var positionY = CGFloat();
        
        if initialClouds {
            positionY = center - 100;
        } else {
            positionY = lastCloudPositionY;
        }
        
        var random = 0;
        
        for i in 0...clouds.count - 1 {
            
            var randomX = CGFloat();
            
            if random == 0 {
                randomX = randomBetweenNumbers(center + 90, secondNum: maxX);
                random = 1;
            } else if random == 1 {
                randomX = randomBetweenNumbers(center - 90, secondNum: minX);
                random = 0;
            }
            
            clouds[i].position = CGPoint(x: randomX, y: positionY);
            clouds[i].zPosition = 3;
            
            if !initialClouds {
                
                if Int(randomBetweenNumbers(0, secondNum: 7)) >= 3 {
                    
                    if clouds[i].name != "Dark Cloud" {
                        let collectable = collectableController.getCollectable();
                        collectable.position = CGPoint(x: clouds[i].position.x, y: clouds[i].position.y + 60);
                        
                        scene.addChild(collectable);
                    }
                    
                }
                
            }
            
            scene.addChild(clouds[i]);
            positionY -= distanceBetweenClouds;
            lastCloudPositionY = positionY;
            
            if initialClouds {
                player.position = CGPoint(x: clouds[0].position.x, y: clouds[0].position.y + 9);
            }
            
        }
        
        
        
    }
    
}





































