//
//  PetEnviroment.swift
//  tekubimon-iphone
//
//  Created by Justin Cheng on 5/1/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import Foundation

class PetEnviroment {
    var activePet: Pet
    var clean: Bool
    var timeTillDirty: Int
    var boss: Pet
    var bossDifficulty: Int
    var stepsTillBattle: Int
    
    init(){
        let name = "Temp Name"
        let level = 1
        let attack = Int(arc4random_uniform(5) + 5)
        let defense = Int(arc4random_uniform(5) + 5)
        let health = Int(arc4random_uniform(15) + 10)
        let speed = Int(arc4random_uniform(5) + 5)
        self.activePet = Pet(name: name,level: level, attack: attack, defense: defense, health: health, speed: speed)
        self.clean = true
        self.timeTillDirty = 6
        self.boss = Pet(name: "Boss",level: 1, attack: 1, defense: 1, health: 1, speed: 1)
        self.bossDifficulty = 1
        self.stepsTillBattle = 2500
    }
    
    func triggerBattle(){
        if stepsTillBattle<=0{
            createBoss()
            victory(self.boss)
            //comment 
            self.stepsTillBattle=2500
        }
    }
    
    func createBoss(){
        self.boss.level = self.bossDifficulty
        self.boss.attack = self.bossDifficulty
        self.boss.defense = self.bossDifficulty
        self.boss.health = self.bossDifficulty
        self.boss.speed = self.bossDifficulty
        
    }
    
    func victory (opponent: Pet)-> Bool{
        if battleSequence(opponent){
            self.activePet.points = self.activePet.points + 3
            bossDifficulty = bossDifficulty + 2
            return true
        }
        return false
    }
    
    func battleSequence(opponent: Pet)-> Bool{
        var activeHealth = activePet.health
        var opponentHealth = opponent.health
        var ourTurn = true
        let faster = self.activePet.speed - opponent.speed
        if faster >= 0 {
            ourTurn = true
        }
        
        while activeHealth>0 && opponentHealth>0{
            if ourTurn{
                opponentHealth = opponentHealth-attackEnemy(opponent)
                ourTurn = false
            }
            else{
                activeHealth = activeHealth-defendSelf(opponent)
                ourTurn = true
            }
            
        }
        
        if opponentHealth<=0{
            return true
        }
        return false
        
    }
    
    func attackEnemy(opponent: Pet)-> Int {
        let damage = self.activePet.attack - Int(opponent.defense/2)
        
        if damage > 0 {
            return damage
        }
        return 0
    }
    
    func defendSelf(opponent: Pet)-> Int {
        let damage = opponent.attack - Int(self.activePet.defense/2)
        
        if damage > 0 {
            return damage
        }
        return 0
    }
    
    func beCleaned(){
        self.clean = true
        self.timeTillDirty = 6
    }
    
    func beDirty (){
        if self.timeTillDirty == 0 {
            self.clean = false
        }
    }
    
}