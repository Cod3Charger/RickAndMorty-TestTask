//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

final class CharactersViewModel: ObservableObject {

    @Published var characters: [Character] = []
    @Published var showErrorAlert: Bool = false

    let service: FetchServiceProtocol
    let router: Router

    init(service: FetchServiceProtocol, router: Router) {
        self.service = service
        self.router = router
    }
}

// MARK: - Fetch Methods

extension CharactersViewModel {
    func getCharacters() {
        Task {
            do {
                let fetchedCharacters = try await service.getCharacters()
                DispatchQueue.main.async {
                    self.characters = fetchedCharacters
                }
            } catch {
                DispatchQueue.main.async {
                    self.showErrorAlert = true
                }
            }
        }
    }
}

// MARK: - Button Tap Methods

extension CharactersViewModel {
    func selectButtonTapped(id: Int) {
        router.goToCharacter(id)
    }
}

// MARK: - Output

extension CharactersViewModel {
    struct Router {
        let goToCharacter: (_ id: Int) -> Void
    }
}
