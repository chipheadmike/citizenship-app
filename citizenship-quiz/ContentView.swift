import SwiftUI

struct ContentView: View {
    @StateObject private var repFetcher = RepFetcher()

    @State private var finalQuestions: [Question] = []
    @State private var showQuiz = false
    @State private var invalidZip = false

    // Persisted across launches
    @AppStorage("savedZipCode") private var zipCode = ""

    @State private var recentScores: [ScoreRecord] = []

    let all50States: [String] = [
        "Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware",
        "Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky",
        "Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi",
        "Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico",
        "New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
        "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont",
        "Virginia","Washington","West Virginia","Wisconsin","Wyoming"
    ]

    let original13: [String] = [
        "New Hampshire","Massachusetts","Rhode Island","Connecticut","New York","New Jersey",
        "Pennsylvania","Delaware","Maryland","Virginia","North Carolina","South Carolina","Georgia"
    ]

    let fakeHolidaysFor100: [String] = [
        "Valentine's Day","St. Patrick's Day","Easter","Halloween",
        "Mother's Day","Father's Day","April Fools' Day","Tax Day"
    ]

    var body: some View {
        NavigationStack {
            if showQuiz {
                QuizView(
                    fullQuestionPool: finalQuestions,
                    onRestart: {
                        showQuiz = false   // just go home; user taps Begin Quiz when ready
                    }
                )
            } else {
                homeScreen
            }
        }
    }

    // MARK: - Home Screen

    private var homeScreen: some View {
        ScrollView {
          VStack(spacing: 0) {
            // Hero
            VStack(spacing: 14) {
                Image(systemName: "building.columns.fill")
                    .font(.system(size: 72))
                    .foregroundStyle(.blue)

                VStack(spacing: 6) {
                    Text("U.S. Citizenship Quiz")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)

                    Text("Prepare for your naturalization interview")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 64)
            .padding(.horizontal, 32)

            // Summary tile (only shown after first quiz)
            if !recentScores.isEmpty {
                summaryTile
                    .padding(.top, 32)
            } else {
                Spacer(minLength: 48)
            }

            Spacer(minLength: 32)

            // ZIP entry card + button
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 10) {
                    Label("Your ZIP Code", systemImage: "location.fill")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)

                    TextField("e.g. 10001", text: $zipCode)
                        .keyboardType(.numberPad)
                        .font(.title3.weight(.medium))
                        .padding(12)
                        .background(Color(.tertiarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    Text("Personalizes your governor, senators, and representative questions.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.secondarySystemBackground))
                )

                if repFetcher.isLoading {
                    ProgressView("Looking up your representatives…")
                        .padding(.vertical, 8)
                } else {
                    Button {
                        beginQuiz()
                    } label: {
                        Text("Begin Quiz")
                            .font(.title3.weight(.semibold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(zipCode.count >= 5 ? Color.blue : Color(.systemGray4))
                            )
                            .foregroundStyle(.white)
                    }
                    .disabled(zipCode.count < 5)
                    .animation(.easeInOut(duration: 0.2), value: zipCode.count >= 5)

                    NavigationLink {
                        FlashcardView(repFetcher: repFetcher)
                    } label: {
                        Label("Study Flashcards", systemImage: "rectangle.stack")
                            .font(.body.weight(.semibold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .strokeBorder(Color.blue, lineWidth: 1.5)
                            )
                            .foregroundStyle(.blue)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 52)
          } // end outer VStack
        } // end ScrollView
        .navigationBarHidden(true)
        .onAppear { recentScores = ScoreHistory.load() }
        .alert("Invalid ZIP Code", isPresented: $invalidZip) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("We couldn't find representatives for that ZIP code. Please double-check and try again.")
        }
    }

    // MARK: - Summary Tile

    private var summaryTile: some View {
        let attempted = recentScores.count
        let passed    = recentScores.filter { $0.passed }.count

        return HStack(spacing: 0) {
            statColumn(value: attempted, label: "Attempted")

            Divider()
                .frame(height: 44)

            statColumn(value: passed, label: "Passed")
        }
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
        )
        .padding(.horizontal, 24)
    }

    private func statColumn(value: Int, label: String) -> some View {
        VStack(spacing: 4) {
            Text("\(value)")
                .font(.system(size: 34, weight: .bold, design: .rounded))
            Text(label)
                .font(.caption.weight(.medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Begin Quiz

    private func beginQuiz() {
        repFetcher.fetchReps(zip: zipCode) {
            DispatchQueue.main.async {
                if repFetcher.reps.isEmpty {
                    invalidZip = true
                } else {
                    prepareQuestions()
                    showQuiz = true
                }
            }
        }
    }

    // MARK: - Prepare Questions

    func prepareQuestions() {
        var transformed: [Question] = []

        for original in USCISData.all {
            if original.text.contains("What are two Cabinet-level positions?") { continue }
            if original.text.contains("What are two rights of everyone living in the United States?") { continue }
            if original.text.contains("What are two ways that Americans can participate in their democracy?") { continue }
            if original.text.contains("There were 13 original states. Name three.") { continue }
            if original.text.contains("Name two national U.S. holidays.") { continue }

            guard let randomCorrect = original.possibleCorrectAnswers.randomElement() else { continue }
            let threeWrongs = Array(original.possibleWrongAnswers.shuffled().prefix(3))
            transformed.append(Question(text: original.text, correctAnswer: randomCorrect, wrongAnswers: threeWrongs))
        }

        // Question #36
        if let q = USCISData.all.first(where: { $0.text.contains("What are two Cabinet-level positions?") }) {
            let correct = randomPair(from: q.possibleCorrectAnswers).joined(separator: ", ")
            transformed.append(Question(text: q.text, correctAnswer: correct,
                                        wrongAnswers: buildDistractorPairs(source: FakeCabinetPositions.all, count: 3)))
        }

        // Question #51
        if let q = USCISData.all.first(where: { $0.text.contains("What are two rights of everyone living in the United States?") }) {
            let correct = randomPair(from: q.possibleCorrectAnswers).joined(separator: ", ")
            transformed.append(Question(text: q.text, correctAnswer: correct,
                                        wrongAnswers: buildDistractorPairs(source: q.possibleWrongAnswers, count: 3)))
        }

        // Question #55
        if let q = USCISData.all.first(where: { $0.text.contains("What are two ways that Americans can participate in their democracy?") }) {
            let correct = randomPair(from: q.possibleCorrectAnswers).joined(separator: ", ")
            transformed.append(Question(text: q.text, correctAnswer: correct,
                                        wrongAnswers: buildDistractorPairs(source: q.possibleWrongAnswers, count: 3)))
        }

        // Question #64
        if let q = USCISData.all.first(where: { $0.text.contains("There were 13 original states. Name three.") }) {
            let correct = randomTriple(from: q.possibleCorrectAnswers).joined(separator: ", ")
            let otherStates = all50States.filter { !original13.contains($0) }
            transformed.append(Question(text: q.text, correctAnswer: correct,
                                        wrongAnswers: buildDistractorTriples(source: otherStates, count: 3)))
        }

        // Question #100
        if let q = USCISData.all.first(where: { $0.text.contains("Name two national U.S. holidays.") }) {
            let correct = randomPair(from: q.possibleCorrectAnswers).joined(separator: ", ")
            transformed.append(Question(text: q.text, correctAnswer: correct,
                                        wrongAnswers: buildDistractorPairs(source: fakeHolidaysFor100, count: 3)))
        }

        // Personalize state-specific questions
        if let userState = repFetcher.reps.first?.state {
            if let gov = CurrentGovernors.governors[userState],
               let idx = transformed.firstIndex(where: { $0.text.contains("Who is the Governor of your state now?") }) {
                let wrongs = Array(CurrentGovernors.governors.filter { $0.key != userState }.values.shuffled().prefix(3))
                transformed[idx] = Question(text: transformed[idx].text, correctAnswer: gov, wrongAnswers: wrongs)
            }
            if let capital = StateCapitals.capitals[userState],
               let idx = transformed.firstIndex(where: { $0.text.contains("What is the capital of your state?") }) {
                let wrongs = Array(StateCapitals.capitals.filter { $0.key != userState }.values.shuffled().prefix(3))
                transformed[idx] = Question(text: transformed[idx].text, correctAnswer: capital, wrongAnswers: wrongs)
            }
        }

        if let senator = repFetcher.reps.first(where: { $0.area == "US Senate" }),
           let idx = transformed.firstIndex(where: { $0.text.contains("Who is one of your state's U.S. Senators now?") }) {
            let wrongs = Array(AllSenators.all.filter { $0 != senator.name }.shuffled().prefix(3))
            transformed[idx] = Question(text: transformed[idx].text, correctAnswer: senator.name, wrongAnswers: wrongs)
        }

        if let rep = repFetcher.reps.first(where: { $0.area == "US House" }),
           let idx = transformed.firstIndex(where: { $0.text.contains("Name your U.S. Representative") }) {
            let wrongs = Array(FakeRepresentatives.all.shuffled().prefix(3))
            transformed[idx] = Question(text: transformed[idx].text, correctAnswer: rep.name, wrongAnswers: wrongs)
        }

        transformed.shuffle()
        finalQuestions = Array(transformed.shuffled().prefix(10))
    }

    // MARK: - Helpers

    func randomTriple(from array: [String]) -> [String] { Array(array.shuffled().prefix(3)) }
    func randomPair(from array: [String]) -> [String]   { Array(array.shuffled().prefix(2)) }

    func buildDistractorTriples(source: [String], count: Int) -> [String] {
        var pool = source.shuffled(); var results: [String] = []
        for _ in 0..<count {
            guard pool.count >= 3 else { break }
            results.append(Array(pool.prefix(3)).joined(separator: ", "))
            pool.removeFirst(3)
        }
        return results
    }

    func buildDistractorPairs(source: [String], count: Int) -> [String] {
        var pool = source.shuffled(); var results: [String] = []
        for _ in 0..<count {
            guard pool.count >= 2 else { break }
            results.append(Array(pool.prefix(2)).joined(separator: ", "))
            pool.removeFirst(2)
        }
        return results
    }
}
