//
//  FlashcardView.swift
//  citizenship-quiz
//

import SwiftUI

// MARK: - Model

struct FlashCard: Identifiable {
    let id = UUID()
    let questionNumber: Int
    let question: String
    let answers: [String]       // all valid answers
}

// MARK: - Main View

struct FlashcardView: View {
    @ObservedObject var repFetcher: RepFetcher

    @State private var cards: [FlashCard] = []
    @State private var flipStates: [Bool] = []
    @State private var currentIndex = 0
    @State private var isShuffled = false

    // State-specific answer lookups
    private var senatorName: String {
        repFetcher.reps.first(where: { $0.area == "US Senate" })?.name
            ?? "Your state's U.S. Senator"
    }
    private var repName: String {
        repFetcher.reps.first(where: { $0.area == "US House" })?.name
            ?? "Your U.S. Representative"
    }
    private var governorName: String {
        guard let state = repFetcher.reps.first?.state else { return "Your state's Governor" }
        return CurrentGovernors.governors[state] ?? "Your state's Governor"
    }
    private var capitalName: String {
        guard let state = repFetcher.reps.first?.state else { return "Your state's capital" }
        return StateCapitals.capitals[state] ?? "Your state's capital"
    }

    private var isCurrentFlipped: Bool {
        guard currentIndex < flipStates.count else { return false }
        return flipStates[currentIndex]
    }

    var body: some View {
        VStack(spacing: 0) {

            // Progress bar + counter
            VStack(spacing: 6) {
                HStack {
                    Text("Card \(currentIndex + 1) of \(cards.count)")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(isCurrentFlipped ? "Tap to see question" : "Tap to reveal answer")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                ProgressView(value: Double(currentIndex + 1),
                             total: Double(max(cards.count, 1)))
                    .progressViewStyle(.linear)
                    .tint(.blue)
                    .animation(.easeInOut(duration: 0.3), value: currentIndex)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 16)

            // Swipeable card deck
            TabView(selection: $currentIndex) {
                ForEach(cards.indices, id: \.self) { index in
                    if index < flipStates.count {
                        FlipCardView(card: cards[index],
                                     isFlipped: $flipStates[index])
                            .padding(.horizontal, 20)
                            .tag(index)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            // Previous / Next buttons
            HStack(spacing: 56) {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        currentIndex = max(0, currentIndex - 1)
                    }
                } label: {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(currentIndex > 0 ? .blue : Color(.systemGray4))
                }
                .disabled(currentIndex == 0)

                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        currentIndex = min(cards.count - 1, currentIndex + 1)
                    }
                } label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(currentIndex < cards.count - 1 ? .blue : Color(.systemGray4))
                }
                .disabled(currentIndex == cards.count - 1)
            }
            .padding(.vertical, 24)
        }
        .navigationTitle("Flashcards")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShuffled.toggle()
                    buildCards()
                } label: {
                    Image(systemName: isShuffled ? "shuffle.circle.fill" : "shuffle.circle")
                        .foregroundStyle(isShuffled ? .blue : .secondary)
                        .font(.title3)
                }
            }
        }
        .onAppear { buildCards() }
    }

    // MARK: - Build Cards

    private func buildCards() {
        var result: [FlashCard] = []
        for (i, q) in USCISData.all.enumerated() {
            var answers = q.possibleCorrectAnswers

            // Substitute personalized answers for state-specific questions
            if q.text.contains("Who is one of your state's U.S. Senators now?") {
                answers = [senatorName]
            } else if q.text.contains("Name your U.S. Representative") {
                answers = [repName]
            } else if q.text.contains("Who is the Governor of your state now?") {
                answers = [governorName]
            } else if q.text.contains("What is the capital of your state?") {
                answers = [capitalName]
            }

            result.append(FlashCard(questionNumber: i + 1,
                                    question: q.text,
                                    answers: answers))
        }

        cards      = isShuffled ? result.shuffled() : result
        flipStates = Array(repeating: false, count: cards.count)
        currentIndex = 0
    }
}

// MARK: - Flip Card View

struct FlipCardView: View {
    let card: FlashCard
    @Binding var isFlipped: Bool

    var body: some View {
        ZStack {
            // Front — Question
            cardFace(tinted: false) {
                VStack(spacing: 0) {
                    Text("Q\(card.questionNumber)")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text(card.question)
                        .font(.title3.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
            }
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .opacity(isFlipped ? 0 : 1)

            // Back — Answers
            cardFace(tinted: true) {
                VStack(spacing: 0) {
                    Text("ANSWER")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    answerContent
                    Spacer()
                    if card.answers.count > 1 {
                        Text("Any one answer is accepted")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
            .opacity(isFlipped ? 1 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                isFlipped.toggle()
            }
        }
    }

    // Shows up to 8 answers; notes overflow for questions with many valid options
    @ViewBuilder
    private var answerContent: some View {
        let display  = Array(card.answers.prefix(8))
        let overflow = card.answers.count - display.count

        if display.count == 1 {
            Text(display[0])
                .font(.title3.weight(.semibold))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        } else {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(display, id: \.self) { answer in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.blue)
                            .font(.caption)
                            .padding(.top, 2)
                        Text(answer)
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                if overflow > 0 {
                    Text("+ \(overflow) more valid answers")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private func cardFace<Content: View>(
        tinted: Bool,
        @ViewBuilder content: () -> Content
    ) -> some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(tinted ? Color.blue.opacity(0.06) : Color(.secondarySystemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(
                        tinted ? Color.blue.opacity(0.25) : Color(.systemGray4).opacity(0.4),
                        lineWidth: 1
                    )
            )
            .overlay(content().padding(24))
            .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 4)
    }
}
