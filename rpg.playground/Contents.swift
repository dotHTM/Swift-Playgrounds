//: Playground - noun: a place where people can play

import Foundation

class BasicRPGElement{
    let name : String
    var weight : Double
    var baseStats : Stats
    
    init(name new_name: String, weight new_weight: Double){
        name = new_name
        weight = new_weight
    }
    
}

class Character : BasicRPGElement{
    var inventory : [Gear] = []
    var equiped : [Gear] = []
    var weightLimit = 10.0
    var encumbered = false
    
    var effectiveStats: Stats {
        get{
            var resultStats = self.baseStats
            self.equiped.forEach{resultStats = resultStats + $0.baseStats}
            return resultStats
        }
    }
    
    func checkEncumbered(){
        var totalInventoryWeight = 0.0
        inventory.forEach{totalInventoryWeight += $0.weight}
        encumbered = (totalInventoryWeight > weightLimit)
    }
    
    
    
    func pickup(_ notOwnedGearItem: Gear){
        inventory.append(notOwnedGearItem)
    }
}

typealias Stats = Dictionary<String,Int>

func + (lhs: Stats, rhs: Stats)->Stats{
    var resultStat : Stats = [:]
    // initialize with all the keys from the the LHS and RHS
    for someItem in lhs { resultStat[someItem.key] = 0 }
    for someItem in rhs { resultStat[someItem.key] = 0 }
    
    // Do the addition
    for someItem in lhs { resultStat[someItem.key]? += someItem.value }
    for someItem in rhs { resultStat[someItem.key]? += someItem.value }
    
    return resultStat
}


enum SideDouble{
    case left(Double)
    case right(Double)
}

enum GearLocation{
    case pocket(Double)
    
    case head(Double)
    case earing(SideDouble)
    case necklace(Double)
    case shoulders(SideDouble)
    case torso(Double)
    case pants(Double)
    case shoes(Double)
    
    case module(Double)
}

class Gear : BasicRPGElement{
    let locationCount : GearLocation = .pocket(0.1)
}




var myCharacter = Character()

myCharacter.baseStats["str"] = 5
myCharacter.baseStats["int"] = 5
myCharacter.baseStats["dex"] = 5
myCharacter.baseStats["mind"] = 5
myCharacter.baseStats["speed"] = 5

myCharacter.effectiveStats

var someGear = Gear()







