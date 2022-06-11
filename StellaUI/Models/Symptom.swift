//
//  Symptom.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import Foundation

struct Symptom: Identifiable, Decodable {
    let id: Int
    let title: String
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName = "image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageName = try container.decode(String.self, forKey: .imageName)
    }
}

extension Symptom: Hashable {
    
}
