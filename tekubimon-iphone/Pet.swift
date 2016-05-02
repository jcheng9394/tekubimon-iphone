//
//  Pet.swift
//  tekubimon
//
//  Created by William Shi on 4/30/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import Foundation

class Pet {
    var name: String
    var level: Int
    var happiness: Int = 50
    var attack: Int
    var defense: Int
    var health: Int
    var speed: Int
    var points: Int = 0
    //sprites?
    
    //not sure if we wanna still add
    //we can set it to a random value upon initialization if we want
    //var rarity: Int
    //var generation: Int
    //var active: Bool = true   //it should be active on creation, and then switch back if the user wants to
    
    //initializer
    //only the name should be user set, the rest should be random or determined by us
    init(name: String, level: Int, attack: Int, defense: Int, health: Int, speed: Int){
        self.name = name
        self.level = level
        //self.happiness = happiness
        self.attack = attack
        self.defense = defense
        self.health = health
        self.speed = speed
        //self.points = points
    }
    
    //maybe put the following two functions into the environment? seems more logical
    //all the battle stuff can probably be put into the environment instead
 
    
    //points should be allocated in view, so maybe pass in the name of the variable the user wants to allocate?
    func allocatePoints(stat: String){
        switch stat {
        case "attack":
            attack += 1
        case "defense":
            defense += 1
        case "health":
            health += 1
        case "speed":
            speed += 1
        default:
            print("Something went wrong in allocatePoints in Pet class")
            //health += 1
        }
    }
    
    func evolve(){
        //interface with healthkit?
    }
    
    //breeding
    
    //
}