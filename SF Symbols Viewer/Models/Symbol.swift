//
//  Symbol.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/10/23.
//

import Foundation

struct Symbol: Identifiable, Hashable {
    let id = UUID()
    let name: String
}
