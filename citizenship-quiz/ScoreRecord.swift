//
//  ScoreRecord.swift
//  citizenship-quiz
//

import Foundation

struct ScoreRecord: Codable, Identifiable {
    var id = UUID()
    let date: Date
    let score: Int
    let total: Int

    var passed: Bool { score >= 6 }
}
