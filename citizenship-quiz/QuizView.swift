// QuizView.swift
import SwiftUI

struct QuizView: View {
    let fullQuestionPool: [Question]
    
    // The 10 questions for this quiz session
    @State private var questions: [Question] = []
    
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    
    // Track how user answered each question
    @State private var answeredQuestions: [AnsweredQuestion] = []
    
    // The set of 4 possible answers for the current question
    @State private var shuffledAnswers: [String] = []
    
    var body: some View {
        VStack {
            if questions.isEmpty {
                Text("No questions available.")
            } else if !showScore {
                // Normal quiz in progress
                Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                    .font(.subheadline)
                    .padding(.top)
                
                Text(questions[currentQuestionIndex].text)
                    .font(.title)
                    .padding()
                
                ForEach(shuffledAnswers, id: \.self) { answer in
                    Button(action: {
                        answerTapped(answer)
                    }) {
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
                // Show final results
                Text("Quiz Complete!")
                    .font(.largeTitle)
                    .padding()
                Text("Your score: \(score) / \(questions.count)")
                    .font(.title2)
                    .padding()
                
                // Filter out only the ones user missed
                let wrongAnswers = answeredQuestions.filter { !$0.wasCorrect }
                
                // If user missed any, show the "Review Missed Questions" button
                if !wrongAnswers.isEmpty {
                    NavigationLink(
                        destination: WrongAnswersView(
                            wrongAnswers: wrongAnswers,
                            onRestart: restartQuiz
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
                    restartQuiz()
                }
                .padding()
                .background(Color.green.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            Spacer()
        }
        .onAppear(perform: startQuiz)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Quiz Methods
    
    func startQuiz() {
        // Shuffle the full pool, pick 10
        questions = Array(fullQuestionPool.shuffled().prefix(10))
        
        currentQuestionIndex = 0
        score = 0
        showScore = false
        answeredQuestions = []
        
        loadShuffledAnswers()
    }
    
    func loadShuffledAnswers() {
        let currentQuestion = questions[currentQuestionIndex]
        let allAnswers = [currentQuestion.correctAnswer] + currentQuestion.wrongAnswers
        shuffledAnswers = allAnswers.shuffled()
    }
    
    func answerTapped(_ userAnswer: String) {
        let currentQ = questions[currentQuestionIndex]
        let wasCorrect = (userAnswer == currentQ.correctAnswer)
        
        if wasCorrect {
            score += 1
        }
        
        // Record how the user answered
        let answered = AnsweredQuestion(
            questionText: currentQ.text,
            correctAnswer: currentQ.correctAnswer,
            userAnswer: userAnswer,
            wasCorrect: wasCorrect
        )
        answeredQuestions.append(answered)
        
        // Move to next question or show final score
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            loadShuffledAnswers()
        } else {
            showScore = true
        }
    }
    
    func restartQuiz() {
        startQuiz()
    }
}
