//
//  Character.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let image: URL

    init(id: Int, name: String, status: String, image: URL) {
        self.id = id
        self.name = name
        self.status = status
        self.image = image
    }
}
