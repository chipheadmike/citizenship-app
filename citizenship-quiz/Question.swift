//
//  Question.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

// Question.swift
// AnsweredQuestion.swift
import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let correctAnswer: String
    let wrongAnswers: [String]
}
