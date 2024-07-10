//
//  CharacterInfo.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import Foundation

struct CharacterInfo: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let type: String
    let species: String
    let image: URL

    init(id: Int, name: String, status: String, gender: String, type: String, species: String, image: URL) {
        self.id = id
        self.name = name
        self.status = status
        self.gender = gender
        self.type = type
        self.species = species
        self.image = image
    }
}
