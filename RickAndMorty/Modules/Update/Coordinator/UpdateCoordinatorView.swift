//
//  UpdateCoordinatorView.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import SwiftUI

struct UpdateCoordinatorView: View {

    private let moduleFactory: ModuleFactory

    @StateObject private var coordinator: UpdateCoordinator

    init(moduleFactory: ModuleFactory, coordinator: UpdateCoordinator) {
        self.moduleFactory = moduleFactory
        self._coordinator = StateObject(wrappedValue: coordinator)
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            destination(.update)
                .navigationDestination(for: UpdateCoordinator.Screen.self) {
                    destination($0)
                        .navigationBarBackButtonHidden()
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: UpdateCoordinator.Screen) -> some View {
        switch screen {
        case .update:
            moduleFactory.makeUpdateView(coordinator: coordinator)
        }
    }
}
