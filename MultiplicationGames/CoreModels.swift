//
//  MultiplicationCoreModels.swift
//  MultiplicationGames
//
//  Created by Anup Kuriakose on 30/12/2025.
//

import Foundation

enum QuestionType {
    case direct          // a × b = ?
    case missingFactor   // a × ? = c  OR  ? × b = c
}

struct MultiplicationQuestion {
    let type: QuestionType
    
    /// Factors (1...12)
    let factorA: Int
    let factorB: Int
    
    /// Product = a * b
    var product: Int { factorA * factorB}
    
    /// If missingFactor:
    /// - missingIsA = true  →  ? × b = product
    /// - missingIsA = false →  a × ? = product
    let factorAmissing: Bool
    
    /// For convenience (what should the student answer?)
    var correctAnswer: Int {
        switch type {
        case .direct:
            return product
        case .missingFactor:
            return factorAmissing ? factorA : factorB
        }
    }
    
    var displayFactorA: String {
        return String(factorA)
    }
    
    var displayFactorB: String {
        return String(factorB)
    }
    
    var displayProduct: String {
        return String(product)
    }
}

extension MultiplicationQuestion {
    var promptText: String {
        switch type {
        case .direct:
            return "\(factorA) × \(factorB) = ?"
        case .missingFactor:
            if factorAmissing {
                return "? × \(factorB) = \(product)"
            } else {
                return "\(factorA) × ? = \(product)"
            }
        }
    }
   
}


