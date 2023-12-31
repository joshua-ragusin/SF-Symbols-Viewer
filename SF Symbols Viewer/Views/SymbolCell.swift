//
//  SymbolCell.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/10/23.
//

import SwiftUI

struct SymbolCell: View {
    
    private let symbol: Symbol
    
    init(symbol: Symbol) {
        self.symbol = symbol
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundColor(.secondary.opacity(0.25))
                    .frame(width: 100, height: 80)
                Image(systemName: symbol.name)
                    .symbolRenderingMode(.monochrome)
                    .foregroundColor(.primary)
                    .imageScale(.large)
                    .font(.system(size: 30))
            }
            
            Text(symbol.name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
    }
}
