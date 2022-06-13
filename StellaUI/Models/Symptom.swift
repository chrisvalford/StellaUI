//
//  Symptom.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import Foundation

struct Symptom: Identifiable, Decodable {
    let id: Int16
    let imageName: String
    var selected: Bool = false
    var sequence = Int16(0)
    var severity = Int16(0)
    var subtitle = ""
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName = "image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int16.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageName = try container.decode(String.self, forKey: .imageName)
    }
    
    init(id: Int16, imageName: String?, title: String?) {
        self.id = id
        self.imageName = imageName ?? "image"
        self.title = title ?? ""
    }
    
    init(mo: SymptomMO) {
        self.id = mo.id
        self.imageName = mo.imageName ?? "image"
        self.selected = mo.selected
        self.sequence = mo.sequence
        self.severity = mo.severity
        self.subtitle = mo.subtitle ?? ""
        self.title = mo.title ?? ""
    }
}

extension Symptom: Hashable, Equatable {
    static func == (lhs: Symptom, rhs: Symptom) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
}


extension SymptomMO {
    var symptom: Symptom {
        var value = Symptom(id: self.id, imageName: self.imageName, title: self.title)
        value.selected = self.selected
        value.sequence = self.sequence
        value.severity = self.severity
        value.subtitle = self.subtitle ?? ""
        return value
    }
}
