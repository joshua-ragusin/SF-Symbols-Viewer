//
//  SymbolDetailView.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/30/23.
//

import SwiftUI

struct SymbolDetailView: View {
    @State private var renderingMode: RenderingModes = .monochrome
    
    private let symbol: Symbol
    
    init(_ symbol: Symbol) {
        self.symbol = symbol
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundColor(.secondary.opacity(0.25))
                    .frame(width: 300, height: 250)
                Image(systemName: symbol.name)
                    .font(.system(size: 120))
                    .symbolRenderingMode(renderingMode.mode())
            }
            
            Text(symbol.name)
                .font(.body)
        }
        .navigationTitle("Symbol Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Picker("Rendering Mode", selection: $renderingMode) {
                        ForEach(RenderingModes.allCases) { mode in
                            Text(String(describing: mode))
                        }
                    }
                    .pickerStyle(.menu)
                } label: {
                    Image(systemSymbol: .ellipsisCircle)
                }
            }
        }
    }
}
