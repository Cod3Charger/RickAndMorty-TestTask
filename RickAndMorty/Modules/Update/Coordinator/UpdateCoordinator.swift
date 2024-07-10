//
//  UpdateCoordinator.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import Foundation

final class UpdateCoordinator: Coordinator {

    enum Screen: Routable {
        case update
    }

    @Published var navigationPath: [Screen] = []

    let goToMainFlow: () -> ()

    init(goToMainFlow: @escaping () -> ()) {
        self.goToMainFlow = goToMainFlow
    }

    func changeFlow() {
        goToMainFlow()
    }
}
