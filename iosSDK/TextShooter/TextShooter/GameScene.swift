//
//  GameScene.swift
//  TextShooter
//
//  Created by  wj on 16/1/27.
//  Copyright (c) 2016年 gzq. All rights reserved.
//

import SpriteKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    private var levelNumber:UInt!
    private var playerLives:Int{
        didSet{
            let lives = childNodeWithName("LivesLabel") as! SKLabelNode
            lives.text = "lives: \(playerLives)"
        }
    }
    
    private var finished = false
    private let playerNode = PlayerNode()
    private let enemies = SKNode()
    private let playerBullets = SKNode()
    private let forceFields = SKNode()
    
    class func scene(size:CGSize,levelNumber:UInt) -> GameScene {
        return GameScene(size: size, levelNumber: levelNumber)
    }
    convenience override init(size: CGSize) {
        self.init(size:size ,levelNumber:1)
    }
    init(size:CGSize, levelNumber:UInt) {
        self.levelNumber = levelNumber
        self.playerLives = 5
        super.init(size: size)
        
        backgroundColor = SKColor.whiteColor()
        
        let lives = SKLabelNode(fontNamed: "Courier")
        lives.fontSize = 16
        lives.fontColor = SKColor.blackColor()
        lives.name = "LivesLabel"
        lives.text = "Lives: \(playerLives)"
        lives.verticalAlignmentMode = .Top
        lives.horizontalAlignmentMode = .Right
        lives.position = CGPointMake(frame.size.width, frame.size.height)
        addChild(lives)
        
        let level = SKLabelNode(fontNamed: "Courier")
        level.fontSize = 16
        level.fontColor = SKColor.blackColor()
        level.name = "LevelLabel"
        level.text = "Level \(levelNumber)"
        level.verticalAlignmentMode = .Top
        level.horizontalAlignmentMode = .Left
        level.position = CGPointMake(0, frame.height)
        addChild(level)
        
        playerNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetHeight(frame) * 0.1)
        addChild(playerNode)
        
        addChild(enemies)
        spawnEnemies()
        
        addChild(playerBullets)
        
        addChild(forceFields)
        createForceFields()
        
        physicsWorld.gravity = CGVectorMake(0, -1)
        physicsWorld.contactDelegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        levelNumber = UInt(aDecoder.decodeIntegerForKey("level"))
        playerLives = aDecoder.decodeIntegerForKey("playerLives")
        super.init(coder: aDecoder)
    }
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(Int(levelNumber), forKey: "level")
        aCoder.encodeInteger(playerLives, forKey: "playerLives")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            if location.y < CGRectGetHeight(frame) * 0.2 {
                let target = CGPointMake(location.x, playerNode.position.y)
                playerNode.moveToward(target)
            }else{
                let bullet = BulletNode.bullet(from: playerNode.position, toward: location)
                playerBullets.addChild(bullet)
            }
            
           
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if finished {
            return
        }
        updateBullets()
        updateEnemies()
        if checkForGameOver() == false{
            checkForNextLevel()
        }
        
    }
    private func spawnEnemies(){
        let count = UInt(log(Float(levelNumber))) + levelNumber
        for var i:UInt = 0; i < count; i++ {
            let enemy = EnemyNode()
            let size = frame.size
            let x = arc4random_uniform(UInt32(size.width * 0.8)) + UInt32(size.width * 0.1)
            let y = arc4random_uniform(UInt32(size.height * 0.5)) + UInt32(size.height * 0.5)
            enemy.position = CGPointMake(CGFloat(x), CGFloat(y))
            enemies.addChild(enemy)
        }
    }
    private func updateBullets(){
        var bulletsToRemove:[BulletNode] = []
        for bullet in playerBullets.children as! [BulletNode]{
            
            if CGRectContainsPoint(frame, bullet.position) == false{
                bulletsToRemove.append(bullet)
                continue
                
            }
            bullet.applyRecurringForce()
        }
        playerBullets.removeChildrenInArray(bulletsToRemove)
    }
    private func updateEnemies(){
        var enemiesToRemove:[EnemyNode] = []
        for node in enemies.children as! [EnemyNode]{
            if CGRectContainsPoint(frame, node.position) == false{
                enemiesToRemove.append(node)
                continue
            }
        }
        enemies.removeChildrenInArray(enemiesToRemove)
    }
    private func checkForNextLevel(){
        if enemies.children.isEmpty{
            goToNextLevel()
        }
    }
    private func goToNextLevel(){
        finished = true
        
        let label = SKLabelNode(fontNamed: "Courier")
        label.text = "Level Complete!"
        label.fontColor = SKColor.blueColor()
        label.fontSize = 32
        label.position = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5)
        addChild(label)
        
        let nextLabel = GameScene(size: frame.size, levelNumber: levelNumber + 1)
        nextLabel.playerLives = playerLives
        view?.presentScene(nextLabel, transition: SKTransition.flipHorizontalWithDuration(1.0))
    }
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == contact.bodyB.categoryBitMask{
            let nodeA = contact.bodyA.node
            let nodeB = contact.bodyB.node
            
            nodeA?.friendlyBumpFrom(nodeB!)
            nodeB?.friendlyBumpFrom(nodeA!)
        }else{
            var attacker:SKNode
            var attackee:SKNode
            
            if  contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask{
                attacker = contact.bodyA.node!
                attackee = contact.bodyB.node!
            }else{
                attacker = contact.bodyB.node!
                attackee = contact.bodyA.node!
            }
            if attackee is PlayerNode{
                playerLives = playerLives - 1
                
            }
            
            attackee.receiveAttacker(attacker, contact: contact)
            
            playerBullets.removeChildrenInArray([attacker])
            enemies.removeChildrenInArray([attacker])
            
        }
    }
    private func triggerGameOver(){
        finished = true
        
        let path = NSBundle.mainBundle().pathForResource("EnemyExplosion", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        explosion.numParticlesToEmit = 200
        explosion.position = playerNode.position
        scene?.addChild(explosion)
        
        playerNode.removeFromParent()
        let transition = SKTransition.doorsOpenVerticalWithDuration(1)
        let gameOver = GameOverScene(size: frame.size)
        view?.presentScene(gameOver, transition: transition)
        
        runAction(SKAction.playSoundFileNamed("gameOver.wav", waitForCompletion: false))
    }
    private func checkForGameOver() -> Bool{
        if playerLives == 0{
            triggerGameOver()
            return true
        }
        return false
    }
    private func createForceFields(){
        let fieldCount = 3
        let size = frame.size
        let sectionWidth = Int(size.width) / fieldCount
        for var i = 0; i < fieldCount;i++ {
            let x = CGFloat(arc4random_uniform(UInt32(sectionWidth)) + UInt32(i * sectionWidth))
            let y = CGFloat(arc4random_uniform(UInt32(size.height * 0.25)) + UInt32(size.height * 0.25))
            
            let gravityField = SKFieldNode.radialGravityField()
            gravityField.position = CGPointMake(x, y)
            gravityField.categoryBitMask = GravityFieldCategory
            gravityField.strength = 4
            gravityField.falloff = 2
            gravityField.region = SKRegion(size: CGSizeMake(size.width * 0.3,size.height * 0.1))
            forceFields.addChild(gravityField)
            
            let fieldLocationNode = SKLabelNode(fontNamed: "Courier")
            fieldLocationNode.fontSize = 16
            fieldLocationNode.fontColor = SKColor.redColor()
            fieldLocationNode.name = "GravityField"
            fieldLocationNode.text = "*"
            fieldLocationNode.position = CGPointMake(x, y)
            forceFields.addChild(fieldLocationNode)
        }
    }
}
