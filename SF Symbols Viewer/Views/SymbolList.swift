//
//  SymbolList.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/10/23.
//

import SwiftUI

struct SymbolList: View {
    @StateObject private var model: SymbolListViewModel
    
    init() {
        _model = StateObject(wrappedValue: SymbolListViewModel())
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                symbolGrid
            }
            .navigationTitle("SF Symbols")
        }
    }
    
    private var symbolGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), alignment: .top)]) {
            ForEach(model.symbols, id: \.id) { symbol in
                Button {
                    print("Selected Symbol: \(symbol.name)")
                } label: {
                    SymbolCell(symbol: symbol)
                }
                .buttonStyle(.plain)
            }
        }
    }
}
