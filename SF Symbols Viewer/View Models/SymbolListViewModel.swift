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
    
    func filterSymbols(by searchParam: String) -> [Symbol] {
        let searchText = searchParam.lowercased()
        let filteredSymbols = symbols.filter { $0.name.contains(searchText) }
        
        return filteredSymbols.sorted {
            switch ($0.name.hasPrefix(searchText), $1.name.hasPrefix(searchText)) {
            case (true, true):
                return $0 < $1
            case (true, false):
                return true
            case (false, true):
                return false
            case (false, false):
                return $0 < $1
            }
        }
    }
    
    private func loadSymbols() {
        let allSymbols = SFSymbol.allSymbols.sorted { $0.rawValue < $1.rawValue }
        
        for symbol in allSymbols {
            symbols.append(Symbol(name: symbol.rawValue))
        }
    }
}
