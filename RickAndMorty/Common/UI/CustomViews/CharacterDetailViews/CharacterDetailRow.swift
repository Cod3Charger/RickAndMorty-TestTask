//
//  CharacterDetailRow.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import SwiftUI

struct CharacterDetailRow: View {
    let title: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: "bell")
                .font(.system(size: 26))
                .foregroundStyle(color)
            Text(title)
                .font(.system(size: 22, weight: .regular))
        }
    }
}
