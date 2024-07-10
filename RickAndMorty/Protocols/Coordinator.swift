//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}
