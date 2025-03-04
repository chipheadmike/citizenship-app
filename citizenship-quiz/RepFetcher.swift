//
//  RepFetcher.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

import SwiftUI

class RepFetcher: ObservableObject {
    @Published var reps: [Representative] = []
    @Published var isLoading = false
    
    @Published var storedZip = ""
    
    /// Fetch House/Senate reps from 5 Calls. Calls `completion` when done.
    func fetchReps(zip: String, completion: (() -> Void)? = nil) {
        self.storedZip = zip
        
        guard let url = URL(string: "https://api.5calls.org/v1/representatives?location=\(zip)") else {
            completion?()
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // Replace with your 5 Calls token
        request.setValue("3357dbdc9acdf9eb32e6cc64", forHTTPHeaderField: "X-5Calls-Token")
        
        isLoading = true
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion?()
                }
            }
            
            guard let data = data, error == nil else {
                print("Network or data error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let decoded = try JSONDecoder().decode(RepResponse.self, from: data)
                DispatchQueue.main.async {
                    self.reps = decoded.representatives
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        }.resume()
    }
}
