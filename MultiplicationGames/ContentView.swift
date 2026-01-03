//
//  ContentView.swift
//  MultiplicationGames
//
//  Created by Anup Kuriakose on 30/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State var question: MultiplicationQuestion = QuestionGenerator.generateQuestion(for: 1)
    @State var levelInput: String = "1"
     
    var body: some View {
        VStack(spacing: 16) {
            QuestionView(question: question)
            HStack(spacing: 16) {
                Text("Enter Level:")
                    .bold()
                    .font(.system(size: 20))
                TextField("", text: $levelInput)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 40)
            }
            .padding(.horizontal, 50)
            Button("Generate Question") {
                if let level = Int(levelInput) {
                    question = QuestionGenerator.generateQuestion(for: level)
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(.blue)
            .clipShape(Capsule())
        }
        .padding()
    }
}

struct QuestionView: View {
    let question: MultiplicationQuestion
    var factorA : String {
        if (question.type == .missingFactor) && (question.factorAmissing == true)  {
            return "?"
        }
        return question.displayFactorA
    }
    
    var factorB : String {
        if (question.type == .missingFactor) && (question.factorAmissing != true)  {
            return "?"
        }
        return question.displayFactorB
    }
    
    var product : String {
        if (question.type == .direct) {
            return "?"
        }
        return question.displayProduct
    }
    
    
    var body: some View {
        HStack {
            Text(factorA)
            Text("x")
            Text(factorB)
            Text("=")
            Text(product)
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
