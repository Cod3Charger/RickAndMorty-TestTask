//
//  CoordinatorProtocols.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import Foundation

protocol UpdateCoordinatorFactory:
    UpdateViewFactory {}

protocol MainCoordinatorFactory:
    CharactersViewFactory,
    CharacterViewFactory {}
