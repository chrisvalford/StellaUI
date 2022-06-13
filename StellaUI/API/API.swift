//
//  API.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import Foundation

@MainActor
class API {
    
    enum ApiError: Error {
        case malformedURL
        case noData
        case fetchError(String)
    }
    
    static func fetchSymptoms() async throws -> [Symptom] {
        guard let url = URL(string: "https://anapp4that.com/data/stella/symptoms.json") else {
            throw ApiError.malformedURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        // TODO: add check for response (data, response)
        let results = try JSONDecoder().decode([Symptom].self, from: data)
        if results.count < 1 {
            throw ApiError.noData
        }
        return results
    }
}
