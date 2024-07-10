//
//  FetchService.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import Foundation

struct FetchService: FetchServiceProtocol {

    func getCharacters() async throws -> [Character] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            throw FetchError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
        
        let characters = response.results.map { result -> Character in
            guard let imageUrl = URL(string: result.image) else {
                fatalError("Invalid image URL")
            }
            return Character(id: result.id, name: result.name, status: result.status, image: imageUrl)
        }
        
        return characters
    }

    func getCharacterInfo(id: Int) async throws -> CharacterInfo {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
            throw FetchError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CharacterResponseInfo.self, from: data)

        guard let imageUrl = URL(string: response.image) else {
            throw FetchError.invalidImageURL
        }

        return CharacterInfo(
            id: response.id,
            name: response.name,
            status: response.status,
            gender: response.gender,
            type: response.type,
            species: response.species,
            image: imageUrl
        )
    }
}

enum FetchError: Error {
    case invalidURL
    case invalidImageURL
}
