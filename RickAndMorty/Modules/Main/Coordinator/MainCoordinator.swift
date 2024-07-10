//
//  MainCoordinator.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

final class MainCoordinator: Coordinator {

    enum Screen: Routable {
        case characters
        case character(id: Int)
    }

    @Published var navigationPath: [Screen] = []
    var characterId: Int?

    func pop() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }

    func push(screen: Screen) {
        switch screen {
        case .character(let id):
            characterId = id
        default:
            break
        }
        navigationPath.append(screen)
    }
}
