//
//  UpdateView.swift
//  RickAndMorty
//
//  Created by Сергей Дашко on 09.07.2024.
//

import SwiftUI

struct UpdateView: View {

    @StateObject private var viewModel: UpdateViewModel

    init(viewModel: UpdateViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Spacer()
        Button {
            viewModel.updateButtonTapped()
        } label: {
            HStack {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.white)
                Text("UPDATE NOW")
                    .foregroundColor(.white)
            }
            .frame(width: 350, height: 50)
            .padding(.horizontal, 5)
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}
