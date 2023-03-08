//
//  ColorItemDetailView.swift
//  Transferable-2023
//
//  Created by Owen Hildreth on 3/8/23.
//

import SwiftUI

struct ColorItemDetailView: View {
    var colorItem: ColorItem? = nil
    
    @State private var borderColor: Color = .black
    @State private var borderWidth: CGFloat = 1.0
    
    var body: some View {
        VStack {
            if let colorItem {
                ColorItemView(colorItem: colorItem)
            } else {
                Text("Drag and Drop a color here!")
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 280, height: 220)
        .background(Color.gray.opacity(0.25))
        .cornerRadius((colorItem != nil) ? 8.0 : 0.0 )
        .border(borderColor, width: (colorItem != nil) ? 0.0 : borderWidth)
        .padding(.trailing)
    }
}

struct ColorItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ColorItemDetailView()
    }
}
