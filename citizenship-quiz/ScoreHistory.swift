//
//  ScoreHistory.swift
//  citizenship-quiz
//

import Foundation

enum ScoreHistory {
    private static let key = "scoreHistory"

    static func load() -> [ScoreRecord] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let records = try? JSONDecoder().decode([ScoreRecord].self, from: data)
        else { return [] }
        return records
    }

    static func append(_ record: ScoreRecord) {
        var records = load()
        records.insert(record, at: 0)   // newest first, no cap
        guard let data = try? JSONEncoder().encode(records) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
