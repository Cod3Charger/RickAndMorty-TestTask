//
//  AppCoordinatorView.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI
import FirebaseRemoteConfig
import FirebaseRemoteConfigSwift

struct AppCoordinatorView: View {

    private let moduleFactory: ModuleFactory

    @ObservedObject private var appCoordinator: AppCoordinator
    let rc = RemoteConfig.remoteConfig()
    @RemoteConfigProperty(key: "needForceUpdate", fallback: true) var needForceUpdate


    init(moduleFactory: ModuleFactory, appCoordinator: AppCoordinator) {
        self.moduleFactory = moduleFactory
        self.appCoordinator = appCoordinator
    }

    var body: some View {
        self.scene
            .onAppear {
                rc.addOnConfigUpdateListener { u, e in
                    rc.activate()
                }
                appCoordinator.change(flow: needForceUpdate ? .update : .main)
            }
    }

    @ViewBuilder
    private var scene: some View {
        switch appCoordinator.flow {
        case .main:
            MainCoordinatorView(
                moduleFactory: moduleFactory,
                coordinator: MainCoordinator()
            )
        case .update:
            UpdateCoordinatorView(
                moduleFactory: moduleFactory,
                coordinator: UpdateCoordinator(goToMainFlow: {
                    appCoordinator.change(flow: .main)
                })
            )
        }
    }
}
