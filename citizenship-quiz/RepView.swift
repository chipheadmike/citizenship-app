//
//  RepView.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

import SwiftUI

struct RepView: View {
    @StateObject var fetcher = RepFetcher()
    @State private var zipCode = ""
    
    var body: some View {
        VStack {
            TextField("Enter your ZIP code", text: $zipCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button("Fetch Representatives") {
                fetcher.fetchReps(zip: zipCode)
            }
            .padding()
            
            if fetcher.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else {
                List(fetcher.reps, id: \.id) { rep in
                    VStack(alignment: .leading) {
                        Text(rep.name).font(.headline)
                        Text("\(rep.area) • \(rep.party)")
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
    }
}

struct RepView_Previews: PreviewProvider {
    static var previews: some View {
        RepView()
    }
}
