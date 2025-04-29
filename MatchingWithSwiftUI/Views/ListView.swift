//
//  ListView.swift
//  MatchingWithSwiftUI
//
//  Created by Ryota Fujitsuka on 2025/04/29.
//

import SwiftUI

struct ListView: View {
    
    private let viewModel = ListViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Cards
            cards
            
            // Actions
            actions
        }
        .background(.black, in: RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 6)
    }
}

#Preview {
    ListView()
}

extension ListView {
    private var cards: some View {
        ZStack {
            ForEach(viewModel.users.reversed()) { user in
                CardView(user: user) { isRedo in
                    viewModel.adjustIndex(isRedo: isRedo)
                }
            }
        }
    }
    
    private var actions: some View {
        HStack(spacing: 68) {
            Button {
                // 実行させたい処理
                viewModel.tappedHandler(action: .nope)
            } label: {
                // swiftUIのView要素を設定 見た目の設定
                Image(systemName: "xmark")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.red)
                    .background {
                        Circle()
                            .stroke(.red, lineWidth: 1)
                            .frame(width: 60, height: 60)
                    }
            }
            
            Button {
                // 実行させたい処理
                viewModel.tappedHandler(action: .redo)
            } label: {
                // swiftUIのView要素を設定 見た目の設定
                Image(systemName: "arrow.counterclockwise.circle")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.yellow)
                    .background {
                        Circle()
                            .stroke(.red, lineWidth: 1)
                            .frame(width: 50, height: 50)
                    }
            }
            
            Button {
                // 実行させたい処理
                viewModel.tappedHandler(action: .like)
            } label: {
                // swiftUIのView要素を設定 見た目の設定
                Image(systemName: "heart")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.mint)
                    .background {
                        Circle()
                            .stroke(.red, lineWidth: 1)
                            .frame(width: 60, height: 60)
                    }
            }

        }
        .foregroundStyle(.white)
        .frame(height: 100)
    }
}
