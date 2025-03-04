//
//  RepResponse.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

import Foundation

struct RepResponse: Codable {
    let location: String
    let lowAccuracy: Bool
    let state: String
    let district: String
    let representatives: [Representative]
}

struct Representative: Codable {
    let id: String
    let name: String
    let phone: String
    let url: String
    let photoURL: String?
    let party: String
    let state: String
    let district: String?
    let reason: String
    let area: String
    let field_offices: [Office]?
}

struct Office: Codable {
    let phone: String
    let city: String
}
