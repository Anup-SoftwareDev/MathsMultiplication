//
//  QuestionGenerator.swift
//  MultiplicationGames
//
//  Created by Anup Kuriakose on 30/12/2025.
//

import Foundation

struct QuestionGenerator {
    static func generateQuestion(for level: Int) -> MultiplicationQuestion {
        let config = LevelConfigProvider.config(for: level)
        
        let type = randomQuestionType(from: config)
        let factorA = randomTable(from: config)
        let factorB = randomOtherFactor(from: config)
        
        switch type {
        case .direct:
            // Plain a × b = ?
            return MultiplicationQuestion(
                type: .direct,
                factorA: factorA,
                factorB: factorB,
                factorAmissing: false
            )
            
        case .missingFactor:
            // Randomly decide which factor is missing
            let missingIsA = Bool.random()
            return MultiplicationQuestion(
                type: .missingFactor,
                factorA: factorA,
                factorB: factorB,
                factorAmissing: missingIsA
            )
        }
    }
    
    static func generateSet(for level: Int, count: Int = 5) -> [MultiplicationQuestion] {
        (0..<count).map { _ in generateQuestion(for: level) }
    }
    
}

