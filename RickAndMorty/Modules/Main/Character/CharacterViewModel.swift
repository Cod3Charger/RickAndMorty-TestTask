//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

final class CharacterViewModel: ObservableObject {

    @Published var characterInfo: CharacterInfo?
    @Published var showErrorAlert: Bool = false
    let id: Int

    let service: FetchServiceProtocol
    let router: Router

    init(id: Int, service: FetchServiceProtocol, router: Router) {
        self.id = id
        self.service = service
        self.router = router
    }
}

// MARK: - Fetch Methods

extension CharacterViewModel {
    func getCharacterInfo() {
        Task {
            do {
                let fetchedCharacterInfo = try await service.getCharacterInfo(id: id)
                DispatchQueue.main.async {
                    self.characterInfo = fetchedCharacterInfo
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

extension CharacterViewModel {

    func backButtonTapped() {
        router.goBack()
    }

    func alertButtonTapped() {
        router.goBack()
    }
}

// MARK: - Output

extension CharacterViewModel {
    struct Router {
        let goBack: () -> Void
    }
}
