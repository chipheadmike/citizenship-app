// QuizView.swift
//
//  citizenship-quiz
//
//  Created by Mike Williams on 3/3/25.
//

// QuizView.swift
import SwiftUI

struct QuizView: View {
    let fullQuestionPool: [Question]
    let onRestart: () -> Void
    
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    
    // For missed questions
    @State private var answeredQuestions: [AnsweredQuestion] = []
    
    // The 4 possible answers for the current question
    @State private var shuffledAnswers: [String] = []
    
    var body: some View {
        ScrollView {
            VStack {
                if questions.isEmpty {
                    Text("No questions available.")
                } else if !showScore {
                    Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                        .font(.subheadline)
                        .padding(.top)
                    
                    Text(questions[currentQuestionIndex].text)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    ForEach(shuffledAnswers, id: \.self) { answer in
                        Button {
                            answerTapped(answer)
                        } label: {
                            Text(answer)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                } else {
                    // Final results
                    Text("Quiz Complete!")
                        .font(.largeTitle)
                        .padding()
                    Text("Your score: \(score) / \(questions.count)")
                        .font(.title2)
                        .padding()
                    
                    let wrongAnswers = answeredQuestions.filter { !$0.wasCorrect }
                    
                    if !wrongAnswers.isEmpty {
                        NavigationLink(
                            destination: WrongAnswersView(
                                wrongAnswers: wrongAnswers,
                                onRestart: onRestart
                            )
                        ) {
                            Text("Review Missed Questions")
                                .padding()
                                .background(Color.orange.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.bottom)
                    }
                    
                    Button("Restart Quiz") {
                        onRestart()
                    }
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                Spacer()
            }
            .onAppear(perform: startQuiz)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Quiz Methods
    
    func startQuiz() {
        questions = fullQuestionPool
        currentQuestionIndex = 0
        score = 0
        showScore = false
        answeredQuestions = []
        
        loadShuffledAnswers()
    }
    
    func loadShuffledAnswers() {
        let currentQ = questions[currentQuestionIndex]
        let allAnswers = [currentQ.correctAnswer] + currentQ.wrongAnswers
        shuffledAnswers = allAnswers.shuffled()
    }
    
    func answerTapped(_ userAnswer: String) {
        let currentQ = questions[currentQuestionIndex]
        let wasCorrect = (userAnswer == currentQ.correctAnswer)
        
        if wasCorrect { score += 1 }
        
        let answered = AnsweredQuestion(
            questionText: currentQ.text,
            correctAnswer: currentQ.correctAnswer,
            userAnswer: userAnswer,
            wasCorrect: wasCorrect
        )
        answeredQuestions.append(answered)
        
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            loadShuffledAnswers()
        } else {
            showScore = true
        }
    }
}
