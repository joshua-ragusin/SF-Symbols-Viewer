//
//  RenderingModes.swift
//  SF Symbols Viewer
//
//  Created by Joshua Ragusin on 6/30/23.
//

import Foundation
import SwiftUI

enum RenderingModes:CaseIterable, Identifiable, CustomStringConvertible {
    case automatic, monochrome, hierarchical, multicolor
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .automatic:
            return "Automatic"
        case .monochrome:
            return "Monochrome"
        case .hierarchical:
            return "Hierarchical"
        case .multicolor:
            return "Multicolor"
        }
    }
    
    func mode() -> SymbolRenderingMode? {
        switch self {
        case .automatic:
            return nil
        case .monochrome:
            return .monochrome
        case .hierarchical:
            return .hierarchical
        case .multicolor:
            return .multicolor
        }
    }
}
