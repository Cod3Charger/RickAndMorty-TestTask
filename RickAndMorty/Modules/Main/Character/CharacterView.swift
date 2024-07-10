//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI

struct CharacterView: View {

    @StateObject private var viewModel: CharacterViewModel

    init(viewModel: CharacterViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                if let characterInfo = viewModel.characterInfo {
                    characterDetailsView(geometry: geometry, characterInfo: characterInfo)
                } else {
                    Text("Something went wrong")
                }
            }
            .navigationBarTitle(viewModel.characterInfo?.name.uppercased() ?? "", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .navigationBarItems(leading: backButton)
            .task {
                viewModel.getCharacterInfo()
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Failed to load character details."),
                    dismissButton: .cancel({
                        viewModel.alertButtonTapped()
                    })
                )
            }
        }
    }
}

// MARK: - ViewBuilder Methods

extension CharacterView {
    @ViewBuilder
    private var backButton: some View {
        Button(action: {
            viewModel.backButtonTapped()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundColor(.blue)
        }
    }
}

// MARK: - Private Methods

private extension CharacterView {
    func characterDetailsView(geometry: GeometryProxy, characterInfo: CharacterInfo) -> some View {
        VStack {
            AsyncImage(url: characterInfo.image) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: geometry.size.height / 2)
            } placeholder: {}
            .clipped()
            .padding(.bottom, 20)

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        CharacterDetailRow(title: characterInfo.status, color: .blue)
                        .padding(.leading, 18)
                        .padding(.bottom, 25)
                        CharacterDetailPanel(title: "STATUS", color: .blue)
                        .frame(width: geometry.size.width / 2)
                        .frame(height: 44)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.primaryGray))
                    }

                    VStack(alignment: .leading) {
                        CharacterDetailRow(title: characterInfo.gender, color: .red)
                        .padding(.leading, 18)
                        .padding(.bottom, 25)
                        CharacterDetailPanel(title: "GENDER", color: .red)
                        .frame(width: geometry.size.width / 2)
                        .frame(height: 44)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.primaryGray))
                    }
                }
                .padding(.bottom, 30)

                HStack {
                    VStack(alignment: .leading) {
                        CharacterDetailRow(title: characterInfo.type.isEmpty ? "None" : characterInfo.type, color: .purple)
                        .padding(.leading, 18)
                        .padding(.bottom, 25)
                        CharacterDetailPanel(title: "TYPE", color: .purple)
                        .frame(width: geometry.size.width / 2)
                        .frame(height: 44)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.primaryGray))
                    }

                    VStack(alignment: .leading) {
                        CharacterDetailRow(title: characterInfo.species, color: .green)
                        .padding(.leading, 18)
                        .padding(.bottom, 25)
                        CharacterDetailPanel(title: "SPECIES", color: .green)
                        .frame(width: geometry.size.width / 2)
                        .frame(height: 44)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.primaryGray))
                    }
                }
            }
            .padding(.top, 25)
        }
    }
}
