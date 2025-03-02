//
//  AnsweredQuestion.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

// AnsweredQuestion.swift
import Foundation

struct AnsweredQuestion: Identifiable {
    let id = UUID()
    let questionText: String
    let correctAnswer: String
    let userAnswer: String
    let wasCorrect: Bool
}
