//
//  LevelConfig.swift
//  MultiplicationGames
//
//  Created by Anup Kuriakose on 30/12/2025.
//

import Foundation

struct LevelConfig {
    let level: Int
    let allowedTables: [Int]
    let maxOtherFactor: Int
    
    let directWeight: Double
    let hardFactorsProbability: Double?
    
    let timeLimitSecondsPerSet: Int?
    
    init(
        level: Int,
        allowedTables: [Int],
        maxOtherFactor: Int,
        directWeight: Double,
        hardFactorsProbability: Double?,
        timeLimitSecondsPerSet: Int?
    ) {
        func clamp(_ value: Double) -> Double {
            return max(0, min(1, value))   // ensures 0 ≤ value ≤ 1
        }
        
        self.level = level
        self.allowedTables = allowedTables
        self.maxOtherFactor = maxOtherFactor
        
        self.directWeight = clamp(directWeight)
        self.hardFactorsProbability = hardFactorsProbability.map { clamp($0) }
        
        self.timeLimitSecondsPerSet = timeLimitSecondsPerSet
    }
}

struct LevelConfigProvider {
    static func config(for level: Int) -> LevelConfig {
        switch level {
        case 1:
            return LevelConfig(
                level: level,
                allowedTables: [1, 2, 5, 10],
                maxOtherFactor: 10,
                directWeight: 1.0,
                hardFactorsProbability: nil,
                timeLimitSecondsPerSet: nil
            )
        case 2:
            return LevelConfig(
                level: level,
                allowedTables: [1, 2, 3, 4, 5, 10],
                maxOtherFactor: 12,
                directWeight: 1.0,
                hardFactorsProbability: nil,
                timeLimitSecondsPerSet: nil
            )
        case 3:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 1.0,
                hardFactorsProbability: nil,
                timeLimitSecondsPerSet: nil
            )
        case 4:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 1.0,
                hardFactorsProbability: 0.7,       // <-- bias toward harder tables
                timeLimitSecondsPerSet: nil
            )
        case 5:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 0.8,
                hardFactorsProbability: nil,
                timeLimitSecondsPerSet: nil
            )
        case 6:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 0.6,
                hardFactorsProbability: nil,
                timeLimitSecondsPerSet: nil
            )
        case 7:
            return LevelConfig(
                level: level,
                allowedTables: Array(4...12),
                maxOtherFactor: 12,
                directWeight: 0.4,
                hardFactorsProbability: 0.7,
                timeLimitSecondsPerSet: nil // optional: you can set e.g. 60
            )
        case 8:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 0.5,
                hardFactorsProbability: 0.8,
                timeLimitSecondsPerSet: 45
            )
        case 9:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 0.4,
                hardFactorsProbability: 0.9,
                timeLimitSecondsPerSet: 30
            )
        case 10:
            return LevelConfig(
                level: level,
                allowedTables: Array(1...12),
                maxOtherFactor: 12,
                directWeight: 0.3,
                hardFactorsProbability: 1.0,
                timeLimitSecondsPerSet: 25
            )
        default:
            // Fallback: treat unknown level as Level 1
            return config(for: 1)
        }
    }
}

