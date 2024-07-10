//
//  Router.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
