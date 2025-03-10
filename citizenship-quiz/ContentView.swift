// ContentView.swift
//
//  citizenship-quiz
//
//  Created by Mike Williams on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var repFetcher = RepFetcher()
    
    // The final single-answer questions for the quiz
    @State private var finalQuestions: [Question] = []
    
    // Controls whether we show the quiz or the start screen
    @State private var showQuiz = false
    
    // ZIP code typed by the user
    @State private var zipCode = ""
    
    // For question #64 logic (the original 13 states)
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
    
    // A small set of "fake" holidays for question #100 distractors
    let fakeHolidaysFor100: [String] = [
        "Valentine's Day","St. Patrick's Day","Easter","Halloween",
        "Mother's Day","Father's Day","April Fools' Day","Tax Day"
    ]
    
    var body: some View {
        // A ZStack to place a semi-transparent gradient behind everything
        ZStack {
            // 1) The semi-transparent red–blue gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.red.opacity(0.2),
                    Color.blue.opacity(0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() // Fill the entire screen
            
            // 2) The main content in a NavigationView
            NavigationView {
                VStack(spacing: 20) {
                    
                    if !showQuiz {
                        // The first screen (asking for ZIP code)
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
                                // Optionally fetch reps from 5 Calls
                                repFetcher.fetchReps(zip: zipCode) {
                                    prepareQuestions()
                                    showQuiz = true
                                }
                            }
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        
                    } else {
                        // Present the quiz with the final single-answer questions
                        QuizView(
                            fullQuestionPool: finalQuestions,
                            onRestart: {
                                // Called when user taps "Restart Quiz" in QuizView
                                prepareQuestions() // get a fresh random set
                                
                                // Force a re-render
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
            }
        }
    }
    
    /// Build a random set of 10 single-answer questions from USCISData,
    /// with special handling for multi-answer Q36, Q51, Q55, Q64, Q100,
    /// plus placeholders for Governor, Senator, Rep, State Capital, etc.
    func prepareQuestions() {
        var transformed: [Question] = []
        
        // 1) Convert each USCISQuestion -> single-answer Question
        //    but skip the multi-answer ones (#36, #51, #55, #64, #100)
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
        
        // 2) Handle question #36 (two Cabinet-level positions)
        if let idx36 = USCISData.all.firstIndex(where: {
            $0.text.contains("What are two Cabinet-level positions?")
        }) {
            let specialQ = USCISData.all[idx36]
            
            // Pick 2 from the 16 real positions
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            
            // Build 3 nonsense pairs from FakeCabinetPositions
            let distractorPairs = buildDistractorPairs(source: FakeCabinetPositions.all, count: 3)
            
            let question36 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question36)
        }
        
        // 3) Handle question #51 (two rights)
        if let idx51 = USCISData.all.firstIndex(where: {
            $0.text.contains("What are two rights of everyone living in the United States?")
        }) {
            let specialQ = USCISData.all[idx51]
            
            // Pick 2 from the correct answers
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            
            // Build 3 pairs from possibleWrongAnswers
            let distractorPairs = buildDistractorPairs(source: specialQ.possibleWrongAnswers, count: 3)
            
            let question51 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question51)
        }
        
        // 4) Handle question #55 (two ways to participate)
        if let idx55 = USCISData.all.firstIndex(where: {
            $0.text.contains("What are two ways that Americans can participate in their democracy?")
        }) {
            let specialQ = USCISData.all[idx55]
            
            let correctPair = randomPair(from: specialQ.possibleCorrectAnswers)
            let correctString = correctPair.joined(separator: ", ")
            
            // 3 pairs from possibleWrongAnswers
            let distractorPairs = buildDistractorPairs(source: specialQ.possibleWrongAnswers, count: 3)
            
            let question55 = Question(
                text: specialQ.text,
                correctAnswer: correctString,
                wrongAnswers: distractorPairs
            )
            transformed.append(question55)
        }
        
        // 5) Handle question #64 (three original states)
        if let idx64 = USCISData.all.firstIndex(where: {
            $0.text.contains("There were 13 original states. Name three.")
        }) {
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
        
        // 6) Handle question #100 (two holidays)
        if let idx100 = USCISData.all.firstIndex(where: {
            $0.text.contains("Name two national U.S. holidays.")
        }) {
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
        
        // 7) Insert placeholders for governor, senator, rep, capital, etc.
        
        // If we have a user state from 5 Calls
        if let userState = repFetcher.reps.first?.state {
            // GOVERNOR
            if let gov = CurrentGovernors.governors[userState],
               let idxGov = transformed.firstIndex(where: {
                   $0.text.contains("Who is the Governor of your state now?")
               }) {
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
            
            // CAPITAL
            if let realCapital = StateCapitals.capitals[userState],
               let idxCap = transformed.firstIndex(where: {
                   $0.text.contains("What is the capital of your state?")
               }) {
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
        
        // SENATOR
        if let senatorRep = repFetcher.reps.first(where: { $0.area == "US Senate" }) {
            if let idxSen = transformed.firstIndex(where: {
                $0.text.contains("Who is one of your state’s U.S. Senators now?")
            }) {
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
        
        // HOUSE Rep (question #23)
        if let houseRep = repFetcher.reps.first(where: { $0.area == "US House" }) {
            if let idxHouse = transformed.firstIndex(where: {
                $0.text.contains("Name your U.S. Representative")
            }) {
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
        
        // 8) Thorough shuffle
        transformed.shuffle()
        transformed.shuffle()
        
        // 9) Build a random set of 10 by random indices
        let allIndices = (0..<transformed.count).shuffled()
        let randomTenIndices = allIndices.prefix(10)
        var chosenTen = randomTenIndices.map { transformed[$0] }
        
        // 10) Shuffle those 10 again
        chosenTen.shuffle()
        
        // 11) Assign to finalQuestions
        finalQuestions = chosenTen
    }
    
    // MARK: - Helpers
    
    /// Returns a random triple from the array
    func randomTriple(from array: [String]) -> [String] {
        let shuffled = array.shuffled()
        return Array(shuffled.prefix(3))
    }
    
    /// Builds `count` triple combos from a source array
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
    
    /// Returns a random pair from the array
    func randomPair(from array: [String]) -> [String] {
        let shuffled = array.shuffled()
        return Array(shuffled.prefix(2))
    }
    
    /// Builds `count` pairs from a source array
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
