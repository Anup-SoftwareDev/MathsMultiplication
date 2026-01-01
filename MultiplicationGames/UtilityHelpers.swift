//
//  MultiplicationUtilityHelpers.swift
//  MultiplicationGames
//
//  Created by Anup Kuriakose on 30/12/2025.
//

import Foundation

func randomTable(from config: LevelConfig) -> Int {
    
    guard config.hardFactorsProbability != nil else {
        return config.allowedTables.randomElement()!
    }
    
    return randomHardFactor(config: config, array: config.allowedTables)

}

func randomOtherFactor(from config: LevelConfig) -> Int {
    
    guard config.hardFactorsProbability != nil else {
        return Int.random(in: 1...config.maxOtherFactor)
    }
    
    let factorArray = Array(1...config.maxOtherFactor)
    
    return randomHardFactor(config: config, array: factorArray)
    
}

private func randomHardFactor(config: LevelConfig, array: [Int]) -> Int {
    let hard = array.filter { $0 >= 6 && $0 != 10}
    let easy = array.filter { $0 < 6 || $0 == 10}
    
    if !hard.isEmpty && Double.random(in: 0...1) < config.hardFactorsProbability! {
        return hard.randomElement()!
    } else {
        return (easy.isEmpty ? hard : easy).randomElement()!
    }
}

func randomQuestionType(from config: LevelConfig) -> QuestionType {
    
    let r = Double.random(in: 0..<1.0)
    return r < config.directWeight ? .direct : .missingFactor
    
}

