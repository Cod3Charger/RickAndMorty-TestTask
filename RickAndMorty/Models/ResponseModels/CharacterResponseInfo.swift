//
//  CharacterResponseInfo.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import Foundation

// MARK: - Result
struct CharacterResponseInfo: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

