// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var fetcher = RepFetcher()
    
    // Master copy of all 100 questions
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
                    
                    if fetcher.isLoading {
                        ProgressView("Loading representatives...")
                    } else {
                        Button("Fetch Representatives") {
                            fetcher.fetchReps(zip: zipCode)
                        }
                    }
                    
                    // If we have reps, let the user continue
                    if !fetcher.reps.isEmpty {
                        Text("Found \(fetcher.reps.count) representative(s).")
                        
                        Button("Start Quiz") {
                            applyRepsToQuestions()
                            showQuiz = true
                        }
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    // Present the QuizView inside a NavigationLink or directly
                    QuizView(fullQuestionPool: allQuestions)
                }
            }
            .padding()
            .navigationTitle("Citizenship Quiz")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /// Dynamically replace placeholders for the user’s Senator/Representative
    func applyRepsToQuestions() {
        // House rep
        if let houseRep = fetcher.reps.first(where: { $0.area == "US House" }) {
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
        
        // Senator
        if let senator = fetcher.reps.first(where: { $0.area == "US Senate" }) {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
