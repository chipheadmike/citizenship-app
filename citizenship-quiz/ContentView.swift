import SwiftUI

struct ContentView: View {
    @StateObject private var repFetcher = RepFetcher()
    
    // The final single-answer questions for the quiz
    @State private var finalQuestions: [Question] = []
    
    // Controls whether we show the quiz or the start screen
    @State private var showQuiz = false
    
    // ZIP code typed by the user
    @State private var zipCode = ""
    
    // State variable to handle an invalid zip code error
    @State private var invalidZip = false
    
    // Full list of 50 states (for question #64 distractors)
    let all50States: [String] = [
        "Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware",
        "Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky",
        "Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi",
        "Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico",
        "New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
        "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont",
        "Virginia","Washington","West Virginia","Wisconsin","Wyoming"
    ]
    
    // The original 13 states (for question #64)
    let original13: [String] = [
        "New Hampshire","Massachusetts","Rhode Island","Connecticut","New York","New Jersey",
        "Pennsylvania","Delaware","Maryland","Virginia","North Carolina","South Carolina","Georgia"
    ]
    
    // A small set of "fake" holidays for question #100 distractors
    let fakeHolidaysFor100: [String] = [
        "Valentine's Day","St. Patrick's Day","Easter","Halloween",
        "Mother's Day","Father's Day","April Fools' Day","Tax Day"
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if !showQuiz {
                    // Start Screen
                    VStack {
                        Text("Please provide your zip code so that we may tailor the test to your specific region.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    Text("U.S. Citizenship Quiz")
                        .font(.largeTitle)
                    
                    TextField("Enter your ZIP code", text: $zipCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.numberPad)
                    
                    if repFetcher.isLoading {
                        ProgressView("Loading data...")
                    } else {
                        Button("Begin Quiz") {
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
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    // Quiz View
                    QuizView(
                        fullQuestionPool: finalQuestions,
                        onRestart: {
                            prepareQuestions() // Rebuild a fresh random set
                            showQuiz = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                showQuiz = true
                            }
                        }
                    )
                }
            }
            .padding()
            .navigationTitle("Citizenship Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $invalidZip) {
                Alert(
                    title: Text("Invalid Zip Code"),
                    message: Text("We couldn't retrieve data for that zip code. Please enter a valid zip code."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    // MARK: - Prepare Questions Function
    
    /// This function builds the finalQuestions array.
    /// It transforms USCISData.all into a set of 10 randomized questions,
    /// handling multi-answer questions (#36, #51, #55, #64, #100) separately,
    /// and inserting placeholders for governor, senator, etc.
    func prepareQuestions() {
        var transformed: [Question] = []
        
        // Convert each USCISQuestion into a single-answer Question,
        // skipping multi-answer questions for special handling.
        for original in USCISData.all {
            if original.text.contains("What are two Cabinet-level positions?") { continue }
            if original.text.contains("What are two rights of everyone living in the United States?") { continue }
            if original.text.contains("What are two ways that Americans can participate in their democracy?") { continue }
            if original.text.contains("There were 13 original states. Name three.") { continue }
            if original.text.contains("Name two national U.S. holidays.") { continue }
            
            guard let randomCorrect = original.possibleCorrectAnswers.randomElement() else { continue }
            
            let wrongs = original.possibleWrongAnswers.shuffled()
            let threeWrongs = Array(wrongs.prefix(3))
            
            let newQ = Question(
                text: original.text,
                correctAnswer: randomCorrect,
                wrongAnswers: threeWrongs
            )
            transformed.append(newQ)
        }
        
        // Special handling for multi-answer questions:
        
        // Question #36: Two Cabinet-level positions
        if let idx36 = USCISData.all.firstIndex(where: { $0.text.contains("What are two Cabinet-level positions?") }) {
            let specialQ = USCISData.all[idx36]
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            let distractorPairs = buildDistractorPairs(source: FakeCabinetPositions.all, count: 3)
            let question36 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question36)
        }
        
        // Question #51: Two rights of everyone living in the United States
        if let idx51 = USCISData.all.firstIndex(where: { $0.text.contains("What are two rights of everyone living in the United States?") }) {
            let specialQ = USCISData.all[idx51]
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            let distractorPairs = buildDistractorPairs(source: specialQ.possibleWrongAnswers, count: 3)
            let question51 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question51)
        }
        
        // Question #55: Two ways that Americans can participate in their democracy
        if let idx55 = USCISData.all.firstIndex(where: { $0.text.contains("What are two ways that Americans can participate in their democracy?") }) {
            let specialQ = USCISData.all[idx55]
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            let distractorPairs = buildDistractorPairs(source: specialQ.possibleWrongAnswers, count: 3)
            let question55 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question55)
        }
        
        // Question #64: Name three original states
        if let idx64 = USCISData.all.firstIndex(where: { $0.text.contains("There were 13 original states. Name three.") }) {
            let specialQ = USCISData.all[idx64]
            let correctTriple = randomTriple(from: specialQ.possibleCorrectAnswers)
            let correctString = correctTriple.joined(separator: ", ")
            let otherStates = all50States.filter { !original13.contains($0) }
            let distractorTriples = buildDistractorTriples(source: otherStates, count: 3)
            let question64 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorTriples
            )
            transformed.append(question64)
        }
        
        // Question #100: Name two national U.S. holidays
        if let idx100 = USCISData.all.firstIndex(where: { $0.text.contains("Name two national U.S. holidays.") }) {
            let specialQ = USCISData.all[idx100]
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            let distractorPairs = buildDistractorPairs(source: fakeHolidaysFor100, count: 3)
            let question100 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question100)
        }
        
        // Insert placeholders using data from repFetcher (if available)
        if let userState = repFetcher.reps.first?.state {
            // GOVERNOR: Use CurrentGovernors
            if let gov = CurrentGovernors.governors[userState],
               let idxGov = transformed.firstIndex(where: { $0.text.contains("Who is the Governor of your state now?") }) {
                let oldQ = transformed[idxGov]
                let dictionaryWithoutUser = CurrentGovernors.governors.filter { $0.key != userState }
                let randomThree = Array(dictionaryWithoutUser.values.shuffled().prefix(3))
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: gov,
                    wrongAnswers: randomThree
                )
                transformed[idxGov] = updatedQ
            }
            
            // CAPITAL: Use StateCapitals
            if let realCapital = StateCapitals.capitals[userState],
               let idxCap = transformed.firstIndex(where: { $0.text.contains("What is the capital of your state?") }) {
                let oldQ = transformed[idxCap]
                let dictionaryWithoutUser = StateCapitals.capitals.filter { $0.key != userState }
                let randomThree = Array(dictionaryWithoutUser.values.shuffled().prefix(3))
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: realCapital,
                    wrongAnswers: randomThree
                )
                transformed[idxCap] = updatedQ
            }
        }
        
        // SENATOR: Use AllSenators, excluding the actual senator
        if let senatorRep = repFetcher.reps.first(where: { $0.area == "US Senate" }) {
            if let idxSen = transformed.firstIndex(where: { $0.text.contains("Who is one of your state’s U.S. Senators now?") }) {
                let oldQ = transformed[idxSen]
                let senatorName = senatorRep.name
                let senatorPool = AllSenators.all.filter { $0 != senatorName }
                let randomThree = Array(senatorPool.shuffled().prefix(3))
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: senatorName,
                    wrongAnswers: randomThree
                )
                transformed[idxSen] = updatedQ
            }
        }
        
        // HOUSE Rep: Use FakeRepresentatives for distractors
        if let houseRep = repFetcher.reps.first(where: { $0.area == "US House" }) {
            if let idxHouse = transformed.firstIndex(where: { $0.text.contains("Name your U.S. Representative") }) {
                let oldQ = transformed[idxHouse]
                let randomFake = Array(FakeRepresentatives.all.shuffled().prefix(3))
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: houseRep.name,
                    wrongAnswers: randomFake
                )
                transformed[idxHouse] = updatedQ
            }
        }
        
        // Thoroughly shuffle and pick 10 random questions
        transformed.shuffle()
        transformed.shuffle()
        let allIndices = (0..<transformed.count).shuffled()
        let randomTenIndices = allIndices.prefix(10)
        var chosenTen = randomTenIndices.map { transformed[$0] }
        chosenTen.shuffle()
        
        finalQuestions = chosenTen
    }
    
    // MARK: - Helper Functions
    
    /// Returns a random triple (3 distinct elements) from an array of strings.
    func randomTriple(from array: [String]) -> [String] {
        let shuffled = array.shuffled()
        return Array(shuffled.prefix(3))
    }
    
    /// Returns a random pair (2 distinct elements) from an array of strings.
    func randomPair(from array: [String]) -> [String] {
        let shuffled = array.shuffled()
        return Array(shuffled.prefix(2))
    }
    
    /// Builds a given number (count) of distractor triples from a source array.
    func buildDistractorTriples(source: [String], count: Int) -> [String] {
        var results: [String] = []
        var pool = source.shuffled()
        for _ in 0..<count {
            if pool.count < 3 { break }
            let triple = Array(pool.prefix(3))
            pool.removeFirst(3)
            results.append(triple.joined(separator: ", "))
        }
        return results
    }
    
    /// Builds a given number (count) of distractor pairs from a source array.
    func buildDistractorPairs(source: [String], count: Int) -> [String] {
        var results: [String] = []
        var pool = source.shuffled()
        for _ in 0..<count {
            if pool.count < 2 { break }
            let pair = Array(pool.prefix(2))
            pool.removeFirst(2)
            results.append(pair.joined(separator: ", "))
        }
        return results
    }
}
