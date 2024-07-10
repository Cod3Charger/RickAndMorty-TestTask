//
//  ModuleFactory.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

final class ModuleFactory: MainCoordinatorFactory {
    let fetchService = FetchService()
}

// MARK: CharactersViewFactory

extension ModuleFactory: UpdateViewFactory {

    func makeUpdateView(coordinator: UpdateCoordinator) -> UpdateView {

        let router = UpdateViewModel.Router.init {
            coordinator.changeFlow()
        }

        let viewModel = UpdateViewModel(router: router)

        return UpdateView(viewModel: viewModel)
    }
}

// MARK: CharactersViewFactory

extension ModuleFactory: CharactersViewFactory {

    func makeCharactersView(coordinator: MainCoordinator) -> CharactersView {

        let router = CharactersViewModel.Router.init { id in
            coordinator.push(screen: .character(id: id))
        }

        let viewModel = CharactersViewModel(service: fetchService, router: router)

        return CharactersView(viewModel: viewModel)
    }
}

// MARK: CharactersViewFactory

extension ModuleFactory: CharacterViewFactory {

    func makeCharacterView(coordinator: MainCoordinator, id: Int) -> CharacterView {

        let router = CharacterViewModel.Router.init {
            coordinator.pop()
        }

        let viewModel = CharacterViewModel(id: id, service: fetchService, router: router)

        return CharacterView(viewModel: viewModel)
    }
}
