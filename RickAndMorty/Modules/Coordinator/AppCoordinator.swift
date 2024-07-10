//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

final class AppCoordinator: ObservableObject {

    enum Flow {
        case update
        case main
    }

    @Published var flow: Flow = .update

    func change(flow: Flow) {
        self.flow = flow
    }
}
