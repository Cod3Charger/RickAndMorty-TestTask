//
//  UpdateViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

final class UpdateViewModel: ObservableObject {

    let router: Router

    init(router: Router) {
        self.router = router
    }
}

// MARK: - Button Tap Methods

extension UpdateViewModel {

    func updateButtonTapped() {
        router.goToCharacters()
    }
}

// MARK: - Output

extension UpdateViewModel {

    struct Router {
        let goToCharacters: () -> Void
    }
}
