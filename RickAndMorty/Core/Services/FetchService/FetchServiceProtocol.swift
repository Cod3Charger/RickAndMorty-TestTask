//
//  FetchServiceProtocol.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import Foundation

protocol FetchServiceProtocol {
    func getCharacters() async throws -> [Character]
    func getCharacterInfo(id: Int) async throws -> CharacterInfo
}
