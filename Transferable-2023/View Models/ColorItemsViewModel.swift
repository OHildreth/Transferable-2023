//
//  ColorItemsViewModel.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import Foundation

class ColorItemsViewModel: ObservableObject {
    @Published var items: [ColorItem] = ColorItem.sampleColors
}
