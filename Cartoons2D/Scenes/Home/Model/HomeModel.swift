//
//  HomeModel.swift
//  Cartoons2D
//
//  Created by Amr Hassan on 28/11/2022.
//

import Foundation

// MARK: - CartonElement
struct HomeModel: Codable {
    var title: String?
    var year: Episodes?
    var creator: Creator?
    var rating: String?
    var genre: GenreUnion?
    var runtimeInMinutes, episodes: Episodes?
    var image: String?
    var id: Episodes?
    
    enum CodingKeys: String, CodingKey {
        case title, year, creator, rating, genre
        case runtimeInMinutes = "runtime_in_minutes"
        case episodes, image, id
    }
}

enum Creator: Codable {
    case string(String)
    case stringArray([String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Creator.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Creator"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

enum Episodes: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Episodes.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Episodes"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum GenreUnion: Codable {
    case enumArray([GenreElement])
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([GenreElement].self) {
            self = .enumArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(GenreUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for GenreUnion"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumArray(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum GenreElement: String, Codable {
    case action = "Action"
    case adventure = "Adventure"
    case comedy = "Comedy"
    case drama = "Drama"
    case family = "Family"
    case short = "Short"
}

typealias HomeDataModel = [HomeModel]
