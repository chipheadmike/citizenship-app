//
//  WrongAnswersView.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

import SwiftUI

struct WrongAnswersView: View {
    let wrongAnswers: [AnsweredQuestion]
    
    // A callback so we can restart the quiz from here
    let onRestart: () -> Void
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Missed Questions Review")
                .font(.headline)
            
            if wrongAnswers.isEmpty {
                Text("You got everything correct!")
            } else {
                let current = wrongAnswers[currentIndex]
                
                Text(current.questionText)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Your Answer: \(current.userAnswer)")
                        .foregroundColor(.red)
                    Text("Correct Answer: \(current.correctAnswer)")
                        .foregroundColor(.green)
                }
                .padding()
                
                HStack {
                    // If there's another missed question, show "Next"
                    if currentIndex < wrongAnswers.count - 1 {
                        Button("Next") {
                            currentIndex += 1
                        }
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    
                    // A "Restart Quiz" button
                    Button("Restart Quiz") {
                        onRestart()
                    }
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}
