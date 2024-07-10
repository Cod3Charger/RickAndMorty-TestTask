//
//  ModuleFactoryProtocols.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

@MainActor
protocol UpdateViewFactory {
    func makeUpdateView(coordinator: UpdateCoordinator) -> UpdateView
}

@MainActor
protocol CharactersViewFactory {
    func makeCharactersView(coordinator: MainCoordinator) -> CharactersView
}

@MainActor
protocol CharacterViewFactory {
    func makeCharacterView(coordinator: MainCoordinator, id: Int) -> CharacterView
}
