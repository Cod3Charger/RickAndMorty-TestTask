//
//  CharacterList.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI

struct CharacterList: View {

    let characters: [Character]
    let selectAction: (Int) -> ()
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(characters) { character in
                        VStack(alignment: .leading) {
                            AsyncImage(url: character.image) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: geometry.size.width / 2 - 20)
                                    .frame(height: geometry.size.height / 3)
                                    .clipped()
                            } placeholder: {}

                            Spacer()

                            Text(character.name)
                                .lineLimit(1)
                                .font(.headline)
                                .padding(.top, 5)
                                .padding(.leading, 5)

                            Text("Status: \(character.status)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 10)
                                .padding(.leading, 5)
                        }
                        .frame(width: geometry.size.width / 2 - 20, height: geometry.size.height / 3 + 50)
                        .background(Color(.systemGray6))
                        .clipShape(BottomRoundedRectangle(cornerRadius: 4))
                        .shadow(color: Color.black.opacity(0.4), radius: 4, x: -2, y: 2)

                        .onTapGesture {
                            selectAction(character.id)
                        }
                    }
                }
                .padding(.horizontal, 7)
            }
            .safeAreaPadding(.bottom, 10)
            .scrollIndicators(.hidden)
        }
    }
}


