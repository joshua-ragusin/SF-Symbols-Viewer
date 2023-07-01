//
//  SymbolList.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/10/23.
//

import SwiftUI

struct SymbolList: View {
    @StateObject private var model: SymbolListViewModel
    
    @State private var searchText = ""
    
    init() {
        _model = StateObject(wrappedValue: SymbolListViewModel())
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                symbolGrid
            }
            .navigationTitle("SF Symbols")
            .searchable(text: $searchText, prompt: "Search")
        }
        .navigationViewStyle(.stack)
    }
    
    private var searchResuls: [Symbol] {
        if searchText.isEmpty {
            return model.symbols
        } else {
            return model.filterSymbols(by: searchText)
        }
    }
    
    private var symbolGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), alignment: .top)]) {
            ForEach(searchResuls, id: \.id) { symbol in
                NavigationLink {
                    SymbolDetailView(symbol)
                } label: {
                    SymbolCell(symbol: symbol)
                }
            }
        }
    }
}
