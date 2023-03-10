//
//  ColorItemView.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import SwiftUI

struct ColorItemView: View {
    
    var colorItem: ColorItem
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color(red: colorItem.red, green: colorItem.green, blue: colorItem.blue)
            Color.black.opacity(0.3)
                .frame(height: 38.0)
            Text(colorItem.name)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
        }
        .cornerRadius(8.0)
        .draggable(colorItem)
        .copyable([colorItem])
    }
}

struct ColorItemView_Previews: PreviewProvider {
    static var previews: some View {
        ColorItemView(colorItem: ColorItem(name: "Color", red: 0.1, green: 0.2, blue: 0.3))
    }
}
