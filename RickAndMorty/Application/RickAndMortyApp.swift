//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI

@main
struct RickAndMortyApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let moduleFactory: ModuleFactory = {
        return ModuleFactory()
    }()

    private let appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(moduleFactory: moduleFactory, appCoordinator: appCoordinator)
        }
    }
}
