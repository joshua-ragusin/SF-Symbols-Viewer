//
//  SymbolListViewModel.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/10/23.
//

import Foundation
import SFSafeSymbols

class SymbolListViewModel: ObservableObject {
    @Published var symbols = [Symbol]()
    
    init() {
        loadSymbols()
    }
    
    private func loadSymbols() {
        let allSymbols = SFSymbol.allSymbols
        
        for symbol in allSymbols.sorted(by: { $0.rawValue < $1.rawValue }) {
            symbols.append(Symbol(name: symbol.rawValue))
        }
    }
}
