// QuizView.swift
//
//  citizenship-quiz
//
//  Created by Mike Williams on 3/3/25.
//

import SwiftUI

struct QuizView: View {
    let fullQuestionPool: [Question]
    let onRestart: () -> Void

    @State private var questions: [Question] = []
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    @State private var answeredQuestions: [AnsweredQuestion] = []
    @State private var shuffledAnswers: [String] = []
    @State private var selectedAnswer: String? = nil
    @State private var isLocked = false
    @State private var scoreProgress: Double = 0
    @State private var hasStarted = false

    private var progress: Double {
        guard !questions.isEmpty else { return 0 }
        return Double(currentQuestionIndex) / Double(questions.count)
    }

    var body: some View {
        Group {
            if questions.isEmpty {
                Text("No questions available.")
                    .foregroundStyle(.secondary)
            } else {
                questionView
            }
        }
        .onAppear {
            guard !hasStarted else { return }
            hasStarted = true
            startQuiz()
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showScore, onDismiss: {
            onRestart()   // fires after sheet fully closes → goes to home screen
        }) {
            scoreSheetView
                .interactiveDismissDisabled(true)
        }
    }

    // MARK: - Question View

    private var questionView: some View {
        VStack(spacing: 0) {
            VStack(spacing: 6) {
                HStack {
                    Text("Question \(currentQuestionIndex + 1)")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("of \(questions.count)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                ProgressView(value: progress)
                    .progressViewStyle(.linear)
                    .tint(.blue)
                    .animation(.easeInOut(duration: 0.4), value: progress)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            .padding(.bottom, 8)

            ScrollView {
                VStack(spacing: 16) {
                    Text(questions[currentQuestionIndex].text)
                        .font(.title3.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.secondarySystemBackground))
                        )
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .id(currentQuestionIndex)

                    VStack(spacing: 10) {
                        ForEach(shuffledAnswers, id: \.self) { answer in
                            Button {
                                answerTapped(answer)
                            } label: {
                                HStack(spacing: 12) {
                                    Text(answer)
                                        .font(.body.weight(.medium))
                                        .multilineTextAlignment(.leading)
                                        .foregroundStyle(answerForeground(for: answer))
                                    Spacer()
                                    answerIcon(for: answer)
                                }
                                .padding(.vertical, 14)
                                .padding(.horizontal, 16)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(answerBackground(for: answer))
                                )
                            }
                            .disabled(isLocked)
                            .animation(.easeInOut(duration: 0.2), value: selectedAnswer)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
        }
    }

    // MARK: - Score Sheet

    private var scoreSheetView: some View {
        let passed = score >= 6
        let fraction = questions.isEmpty ? 0.0 : Double(score) / Double(questions.count)

        return VStack(spacing: 0) {
            // Scrollable scorecard
            ScrollView {
                VStack(spacing: 24) {
                    // Score ring
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .stroke(Color(.systemGray5), lineWidth: 12)
                                .frame(width: 140, height: 140)
                            Circle()
                                .trim(from: 0, to: scoreProgress)
                                .stroke(
                                    passed ? Color.green : Color.orange,
                                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                                )
                                .frame(width: 140, height: 140)
                                .rotationEffect(.degrees(-90))
                            VStack(spacing: 4) {
                                Text("\(score) / \(questions.count)")
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                Text(passed ? "PASSED" : "NOT YET")
                                    .font(.caption.weight(.heavy))
                                    .tracking(1.5)
                                    .foregroundStyle(passed ? .green : .orange)
                            }
                        }
                        Text(passed
                             ? "You're ready for the interview!"
                             : "A passing score is 6 out of 10.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 28)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeOut(duration: 1.0)) {
                                scoreProgress = fraction
                            }
                        }
                    }

                    // Question breakdown
                    VStack(spacing: 0) {
                        ForEach(Array(answeredQuestions.enumerated()), id: \.element.id) { index, answered in
                            if index > 0 {
                                Divider().padding(.leading, 48)
                            }
                            resultRow(answered)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.secondarySystemBackground))
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                }
            }

            // Pinned Try Again button
            VStack(spacing: 0) {
                Divider()
                Button {
                    showScore = false   // sheet closes → onDismiss → home screen
                } label: {
                    Label("Try Again", systemImage: "arrow.clockwise")
                        .font(.body.weight(.semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color.blue))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
            }
            .background(Color(.systemBackground))
        }
    }

    private func resultRow(_ answered: AnsweredQuestion) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: answered.wasCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(answered.wasCorrect ? .green : .red)
                .font(.body)
                .padding(.top, 1)

            VStack(alignment: .leading, spacing: 4) {
                Text(answered.questionText)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                if !answered.wasCorrect {
                    Text("Correct: \(answered.correctAnswer)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }

    // MARK: - Answer Styling Helpers

    private func answerBackground(for answer: String) -> Color {
        guard let selected = selectedAnswer else {
            return Color(.secondarySystemBackground)
        }
        let correct = questions[currentQuestionIndex].correctAnswer
        if answer == correct { return .green }
        if answer == selected { return .red }
        return Color(.secondarySystemBackground)
    }

    private func answerForeground(for answer: String) -> Color {
        guard let selected = selectedAnswer else {
            return Color(.label)
        }
        let correct = questions[currentQuestionIndex].correctAnswer
        if answer == correct || answer == selected { return .white }
        return Color(.label)
    }

    @ViewBuilder
    private func answerIcon(for answer: String) -> some View {
        if let selected = selectedAnswer {
            let correct = questions[currentQuestionIndex].correctAnswer
            if answer == correct {
                Image(systemName: "checkmark.circle.fill").foregroundStyle(.white)
            } else if answer == selected {
                Image(systemName: "xmark.circle.fill").foregroundStyle(.white)
            } else {
                Color.clear.frame(width: 22, height: 22)
            }
        } else {
            Color.clear.frame(width: 22, height: 22)
        }
    }

    // MARK: - Quiz Logic

    func startQuiz() {
        questions = fullQuestionPool
        currentQuestionIndex = 0
        score = 0
        showScore = false
        answeredQuestions = []
        selectedAnswer = nil
        isLocked = false
        scoreProgress = 0
        loadShuffledAnswers()
    }

    func loadShuffledAnswers() {
        let q = questions[currentQuestionIndex]
        shuffledAnswers = ([q.correctAnswer] + q.wrongAnswers).shuffled()
    }

    func answerTapped(_ userAnswer: String) {
        guard !isLocked else { return }
        isLocked = true

        withAnimation(.easeInOut(duration: 0.2)) {
            selectedAnswer = userAnswer
        }

        let currentQ = questions[currentQuestionIndex]
        let wasCorrect = (userAnswer == currentQ.correctAnswer)

        let feedback = UINotificationFeedbackGenerator()
        feedback.notificationOccurred(wasCorrect ? .success : .error)

        if wasCorrect { score += 1 }
        answeredQuestions.append(AnsweredQuestion(
            questionText: currentQ.text,
            correctAnswer: currentQ.correctAnswer,
            userAnswer: userAnswer,
            wasCorrect: wasCorrect
        ))

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            withAnimation(.easeInOut(duration: 0.3)) {
                selectedAnswer = nil
                isLocked = false
                if currentQuestionIndex + 1 < questions.count {
                    currentQuestionIndex += 1
                    loadShuffledAnswers()
                } else {
                    ScoreHistory.append(ScoreRecord(date: Date(), score: score, total: questions.count))
                    showScore = true
                }
            }
        }
    }
}
