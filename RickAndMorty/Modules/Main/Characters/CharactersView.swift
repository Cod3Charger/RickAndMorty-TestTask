//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI

struct CharactersView: View {

    @StateObject private var viewModel: CharactersViewModel

    init(viewModel: CharactersViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        CharacterList(characters: viewModel.characters) { id in
            viewModel.selectButtonTapped(id: id)
        }
        .navigationTitle("Characters")
        .task {
            viewModel.getCharacters()
        }
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Failed to load characters."),
                dismissButton: .cancel()
            )
        }
    }
}
