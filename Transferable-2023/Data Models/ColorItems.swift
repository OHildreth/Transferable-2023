//
//  ColorItems.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ColorItem: Identifiable {
    var id = UUID()
    var name: String
    
    var red: Double
    var green: Double
    var blue: Double
}


// MARK: - Sample Colors
extension ColorItem {
    static var sampleColors: [ColorItem] {
        [
            ColorItem(name: "Amethyst", red: 0.6, green: 0.364, blue: 0.898),
            ColorItem(name: "Magenta Crayola", red: 0.945, green: 0.357, blue: 0.71),
            ColorItem(name: "Minion Yellow", red: 0.996, green: 0.894, blue: 0.25),
            ColorItem(name: "Capri", red: 0.0, green: 0.734, blue: 0.976),
            ColorItem(name: "Sea Gree Crayola", red: 0.0, green: 0.96, blue: 0.831),
        ]
    }
}


// MARK: - Transferable
extension ColorItem: Codable, Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: ColorItem.self, contentType: .colorItem)
    }
    
}


extension UTType {
    static var colorItem = UTType(exportedAs: "edu.HRG.colorItem")
}
