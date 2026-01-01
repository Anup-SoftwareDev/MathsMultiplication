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
            Text(question.promptText)
                .font(.title)
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

#Preview {
    ContentView()
}
