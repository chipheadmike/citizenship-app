//
//  citizenship_quizTests.swift
//  citizenship-quizTests
//
//  Created by Mike Williams on 3/2/25.
//

//
//  RepFetcherTests.swift
//  CitizenshipAppTests
//

import XCTest
@testable import citizenship_quiz  // Replace with your app's module name

final class RepFetcherTests: XCTestCase {
    
    func testFetchRepsWithValidZip() throws {
        // 1. Create the fetcher
        let fetcher = RepFetcher()
        
        // 2. Create an expectation so we can wait for the async call
        let expectation = XCTestExpectation(description: "Fetch representatives from 5 Calls API")
        
        // 3. Call the fetch method with a valid ZIP code
        fetcher.fetchReps(zip: "30178")
        
        // 4. Wait briefly, then check results
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // 5. Assert that we have at least one rep
            XCTAssertFalse(fetcher.reps.isEmpty, "Representatives should not be empty for a valid ZIP code.")
            
            // 6. Fulfill the expectation
            expectation.fulfill()
        }
        
        // 7. Wait up to 10 seconds for the async call to complete
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchRepsWithInvalidZip() throws {
        let fetcher = RepFetcher()
        let expectation = XCTestExpectation(description: "Attempt fetch with invalid ZIP")
        
        // This ZIP is presumably invalid
        fetcher.fetchReps(zip: "99999")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // In this scenario, the array might be empty or the API might return an error
            // Adjust your assertion based on how your code handles invalid ZIPs
            XCTAssertTrue(fetcher.reps.isEmpty, "Representatives should be empty for an invalid ZIP code.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
