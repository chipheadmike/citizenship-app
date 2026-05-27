//
//  WrongAnswersView.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

import SwiftUI

struct WrongAnswersView: View {
    let wrongAnswers: [AnsweredQuestion]
    let onRestart: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var currentIndex = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if wrongAnswers.isEmpty {
                    Text("You got everything correct!")
                        .foregroundStyle(.secondary)
                } else {
                    let current = wrongAnswers[currentIndex]

                    // Progress indicator
                    HStack {
                        Text("Missed question \(currentIndex + 1) of \(wrongAnswers.count)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Question card
                    Text(current.questionText)
                        .font(.title3.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.secondarySystemBackground))
                        )
                        .padding(.horizontal)

                    // Answer cards
                    VStack(spacing: 10) {
                        answerCard(
                            label: "Your Answer",
                            value: current.userAnswer,
                            color: .red,
                            icon: "xmark.circle.fill"
                        )
                        answerCard(
                            label: "Correct Answer",
                            value: current.correctAnswer,
                            color: .green,
                            icon: "checkmark.circle.fill"
                        )
                    }
                    .padding(.horizontal)

                    // Navigation buttons
                    VStack(spacing: 12) {
                        if currentIndex < wrongAnswers.count - 1 {
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    currentIndex += 1
                                }
                            } label: {
                                Label("Next Missed Question", systemImage: "arrow.right")
                                    .font(.body.weight(.semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue))
                                    .foregroundStyle(.white)
                            }
                        }

                        Button {
                            dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                onRestart()
                            }
                        } label: {
                            Label("Try Again", systemImage: "arrow.clockwise")
                                .font(.body.weight(.semibold))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.green))
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 40)
        }
        .navigationTitle("Missed Questions")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func answerCard(label: String, value: String, color: Color, icon: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(color)
                .font(.title3)
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(color)
                Text(value)
                    .font(.body)
                    .foregroundStyle(Color(.label))
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color.opacity(0.3), lineWidth: 1)
                )
        )
    }
}
