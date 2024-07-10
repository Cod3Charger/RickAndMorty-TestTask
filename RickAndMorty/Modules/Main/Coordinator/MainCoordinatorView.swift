//
//  MainCoordinatorView.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI

struct MainCoordinatorView: View {

    private let moduleFactory: MainCoordinatorFactory

    @StateObject private var coordinator: MainCoordinator

    init(moduleFactory: MainCoordinatorFactory, coordinator: MainCoordinator) {
        self.moduleFactory = moduleFactory
        self._coordinator = StateObject(wrappedValue: coordinator)
    }

    var body: some View {
        TabView {
            NavigationStack(path: $coordinator.navigationPath) {
                destination(.characters)
                    .navigationDestination(for: MainCoordinator.Screen.self) {
                        destination($0)
                            .navigationBarBackButtonHidden()
                    }
            }
            .tabItem { Label("Characters", systemImage: "person") }
            
            TabView {}
                .tabItem { Label("Locations", systemImage: "globe") }
            
            TabView {}
                .tabItem { Label("Episodes", systemImage: "display") }
            
            TabView {}
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }

    @ViewBuilder
    private func destination(_ screen: MainCoordinator.Screen) -> some View {
        switch screen {
        case .characters:
            moduleFactory.makeCharactersView(coordinator: coordinator)
        case .character:
            if let id = coordinator.characterId {
                moduleFactory.makeCharacterView(coordinator: coordinator, id: id)
            } else {
                Text("Character not found")
            }
        }
    }
}
