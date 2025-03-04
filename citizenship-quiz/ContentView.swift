// ContentView.swift
//
//  citizenship-quiz
//
//  Created by Mike Williams on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var repFetcher = RepFetcher()
    
    // Your full set of 100 questions
    @State private var allQuestions: [Question] = QuestionsData.all
    
    @State private var showQuiz = false
    @State private var zipCode = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if !showQuiz {
                    Text("U.S. Citizenship Quiz")
                        .font(.largeTitle)
                    
                    TextField("Enter your ZIP code", text: $zipCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.numberPad)
                    
                    if repFetcher.isLoading {
                        ProgressView("Loading data...")
                    } else {
                        // Single button to fetch reps & start quiz
                        Button("Begin Quiz") {
                            beginQuiz()
                        }
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    // Present the quiz with updated questions
                    QuizView(fullQuestionPool: allQuestions)
                }
            }
            .padding()
            .navigationTitle("Citizenship Quiz")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /// Called when user taps "Begin Quiz"
    func beginQuiz() {
        // Fetch House/Senate from 5 Calls, then update placeholders & show quiz
        repFetcher.fetchReps(zip: zipCode) {
            applyFetchedDataToQuestions()
            showQuiz = true
        }
    }
    
    /// Replace placeholders with real data (rep, senator, governor, capital)
    /// and randomize the "Name one U.S. territory" question.
    func applyFetchedDataToQuestions() {
        
        // 1) U.S. Representative
        if let houseRep = repFetcher.reps.first(where: { $0.area == "US House" }) {
            if let index = allQuestions.firstIndex(where: {
                $0.text.contains("Name your U.S. Representative")
            }) {
                let oldQ = allQuestions[index]
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: houseRep.name,
                    wrongAnswers: oldQ.wrongAnswers
                )
                allQuestions[index] = updatedQ
            }
        }
        
        // 2) U.S. Senator
        if let senator = repFetcher.reps.first(where: { $0.area == "US Senate" }) {
            if let index = allQuestions.firstIndex(where: {
                $0.text.contains("Who is one of your state’s U.S. Senators now?")
            }) {
                let oldQ = allQuestions[index]
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: senator.name,
                    wrongAnswers: oldQ.wrongAnswers
                )
                allQuestions[index] = updatedQ
            }
        }
        
        // 3) Governor (from your CurrentGovernors.swift)
        if let userState = repFetcher.reps.first?.state,
           let governor = CurrentGovernors.governors[userState] {
            if let index = allQuestions.firstIndex(where: {
                $0.text.contains("Who is the Governor of your state now?")
            }) {
                let oldQ = allQuestions[index]
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: governor,
                    wrongAnswers: oldQ.wrongAnswers
                )
                allQuestions[index] = updatedQ
            }
        }
        
        // 4) State Capital (from StateCapitals.swift)
        if let userState = repFetcher.reps.first?.state,
           let correctCapital = StateCapitals.capitals[userState] {
            if let index = allQuestions.firstIndex(where: {
                $0.text.contains("What is the capital of your state?")
            }) {
                let oldQ = allQuestions[index]
                
                // Optionally generate random distractors
                var allCapitals = Array(StateCapitals.capitals.values)
                allCapitals.removeAll(where: { $0 == correctCapital })
                allCapitals.shuffle()
                let threeWrong = Array(allCapitals.prefix(3))
                
                let updatedQ = Question(
                    text: oldQ.text,
                    correctAnswer: correctCapital,
                    wrongAnswers: threeWrong
                )
                allQuestions[index] = updatedQ
            }
        }
        
        // 5) Randomize "Name one U.S. territory" (from USATerritories.swift)
        if let index = allQuestions.firstIndex(where: {
            $0.text.contains("Name one U.S. territory")
        }) {
            let oldQ = allQuestions[index]
            
            // Shuffle the entire territory list
            var territoryPool = USATerritories.all
            territoryPool.shuffle()
            
            // The first is the correct territory
            let correctTerritory = territoryPool.removeFirst()
            // Next 3 are distractors
            let distractors = Array(territoryPool.prefix(3))
            
            let updatedQ = Question(
                text: oldQ.text,
                correctAnswer: correctTerritory,
                wrongAnswers: distractors
            )
            allQuestions[index] = updatedQ
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
