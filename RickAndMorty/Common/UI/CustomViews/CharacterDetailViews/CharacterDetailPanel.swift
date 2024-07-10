//
//  CharacterDetailPanel.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 10.07.2024.
//

import SwiftUI

struct CharacterDetailPanel: View {
    let title: String
    let color: Color

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(color)
        }
    }
}
