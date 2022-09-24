//
//  Pets.swift
//  HaoranSong-Lab2
//
//  Created by Haoran Song on 9/20/22.
//

import Foundation

class Pets{
    // Data
    var happyLevel:Int
    var foodLevel:Int
    var petName: String
    // Behavior
    func play(){
        if(foodLevel>0){
            happyLevel += 1
            if(happyLevel>10){
                happyLevel = 10
            }
            foodLevel -= 1
        }
    }
     
    func feed(){
        foodLevel += 1
        if(foodLevel>10){
            foodLevel = 10
        }
    }
    // Init
    init(name: String,happyInput: Int, foodInput: Int){
        self.petName = name
        self.happyLevel = happyInput
        self.foodLevel = foodInput
    }
}
