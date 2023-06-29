//
//  Symbol.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/10/23.
//

import Foundation

struct Symbol: Identifiable, Hashable, Comparable {
    let id = UUID()
    let name: String
    
    static func < (lhs: Symbol, rhs: Symbol) -> Bool {
        return lhs.name < rhs.name
    }
}
